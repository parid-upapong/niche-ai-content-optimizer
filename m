import json
import pandas as pd
from typing import List, Dict

class NicheDatasetGenerator:
    """
    Transforms Brand Lexicons and Niche Semantic Maps into instruction-tuning 
    datasets (JSONL) for domain adaptation.
    """
    def __init__(self, brand_id: str, industry_niche: str):
        self.brand_id = brand_id
        self.industry_niche = industry_niche

    def format_for_instruction_tuning(self, raw_data: List[Dict]) -> List[Dict]:
        """
        Converts raw niche terminology into (Instruction, Input, Output) format.
        Focuses on 'Niche Terminology Correctness' and 'Brand Voice Alignment'.
        """
        formatted_data = []
        for entry in raw_data:
            template = {
                "instruction": f"Rewrite the following content using {self.industry_niche} industry terminology and the specific brand voice of {self.brand_id}.",
                "input": entry.get("generic_text"),
                "output": entry.get("niche_optimized_text")
            }
            formatted_data.append(template)
        return formatted_data

    def save_to_jsonl(self, data: List[Dict], filename: str):
        with open(filename, 'w', encoding='utf-8') as f:
            for entry in data:
                f.write(json.dumps(entry, ensure_ascii=False) + '\n')

# Example Usage:
# processor = NicheDatasetGenerator("EchoNiche_SME_Thai", "E-commerce Logistics")
# raw_samples = [{"generic_text": "ส่งของไวมาก", "niche_optimized_text": "ยกระดับ Last-mile delivery ด้วยความรวดเร็วระดับพรีเมียม"}]
# processor.save_to_jsonl(processor.format_for_instruction_tuning(raw_samples), "train_niche_v1.jsonl")