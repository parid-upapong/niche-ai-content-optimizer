"""
EchoNiche AI: Brand Voice Synthesis (BVS) Utility
This module prepares the prompt context by calculating the alignment 
between the brand profile and the generated content instructions.
"""

import json

class BVSOrchestrator:
    def __init__(self, brand_dna: dict):
        self.brand_dna = brand_dna
        self.tone = brand_dna.get("tone_attributes", "Neutral")
        self.lexicon = brand_dna.get("lexicon", {})

    def generate_instruction_set(self) -> str:
        """
        Converts structured Brand DNA into a natural language instruction 
        block for the LLM's system prompt.
        """
        preferred = ", ".join(self.lexicon.get("preferred", []))
        forbidden = ", ".join(self.lexicon.get("forbidden", []))
        
        instruction = f"""
        ### BRAND VOICE GUIDELINES:
        - TONE: {self.tone}
        - MANDATORY VOCABULARY: [{preferred}]
        - PROHIBITED VOCABULARY: [{forbidden}]
        - WRITING STYLE: {self.brand_dna.get('sentence_structure', 'Standard')}
        
        IMPORTANT: Your output will be graded on how well you embody the '{self.tone}' 
        persona and your adherence to the mandatory vocabulary.
        """
        return instruction

# Example Usage
# brand_profile = {"tone_attributes": "High-Energy Tech Enthusiast", "lexicon": {"preferred": ["Disrupt", "Seamless", "Flow"], "forbidden": ["Utilize", "Standard"]}}
# bvs = BVSOrchestrator(brand_profile)
# print(bvs.generate_instruction_set())