# ADHD Module — OpenEvidence Verification Tracker

Working document for evidence-reviewing `modules/adhd.json` before finalization. Not read by the app. See plan at `/home/noahs/.claude/plans/i-d-like-to-move-vivid-moore.md` for context.

**Workflow:** Run the meta-pass prompt first. Then run Bundle 1 (regulatory/pharmacology — the black-and-white facts) to calibrate prompt wording. Iterate if needed. Then run Bundles 2–8. Log each claim's verdict in the tracker table at the bottom. Once verdicts are captured, a follow-up coding session adds a `references[]` field to `adhd.json` with `[ref:X]` markers in the prose.

**Framing note:** All prompts ask for genuine pushback, not confirmation. If OE comes back "everything is correct," re-run with tighter wording — blanket confirmation usually means the prompt was too leading.

---

## Meta-pass prompt (run first)

```
I'm finalizing a primary care decision-support module on managing adult
patients inherited on stimulant therapy for ADHD. The content below was
drafted from general knowledge and has not been evidence-reviewed.

Please read it end-to-end and flag any statement that is: factually
inaccurate, outdated (pre-2022 guidance that has since changed), lacking
evidence support, controversial among specialists, or oversimplified in a
way that could mislead a primary care provider. For each flag, cite the
source and give the corrected framing.

Content:
[paste entire `faqs` array text from modules/adhd.json]
```

**Meta-pass findings:**

_(paste OE response summary + flagged statements here)_
I'll systematically review each section against current evidence and guidelines.

Below is a section-by-section evidence review of the draft module. Each flag identifies the specific claim, explains the issue, and provides the corrected framing with citations.

---

**Section: Ceiling Doses (faq_id: ceiling-dose)*****

**Flag 1 — Amphetamine salts (Adderall) "FDA max 60 mg/day" is incorrect.**

The draft states the FDA max for Adderall is 60 mg/day for adults. This conflates the IR and ER formulations. The FDA-approved label for **Adderall IR (mixed amphetamine salts tablets) lists a maximum of 40 mg/day**, not 60 mg.[1] The **Adderall XR (extended-release capsules) label recommends 20 mg/day** as the starting and typical adult dose, with clinical trial data showing no adequate evidence that doses greater than 20 mg/day conferred additional benefit.[2][3] The 2024 AAFP review lists IR max at 40 mg/day and ER max at 60 mg/day.[4] The Cochrane review similarly cites the FDA-approved range for MAS as 5–40 mg/day.[5]

Corrected framing: "Adderall IR: FDA max **40 mg/day**. Adderall XR: FDA label recommends 20 mg/day; doses up to 60 mg/day were studied in clinical trials but without evidence of additional benefit beyond 20 mg/day. The 40 mg/day threshold for heightened documentation in primary care applies to the IR formulation; for XR, doses above 20 mg/day already exceed the evidence-supported range."

**Flag 2 — Methylphenidate "FDA max 60 mg/day" is incomplete and misleading.**

The draft states a blanket FDA max of 60 mg/day for methylphenidate. This is true for IR and some SR formulations, but **Concerta (methylphenidate OROS extended-release) has an FDA-approved maximum of 72 mg/day for adults**.[6][7] A primary care module that states "60 mg/day" as the ceiling could lead a provider to inappropriately flag a patient on Concerta 72 mg as exceeding the FDA maximum.

Corrected framing: "Methylphenidate IR/SR: FDA max 60 mg/day. **Concerta (OROS ER): FDA max 72 mg/day for adults.** Extended-release formulations vary by product — always verify the specific product's label."

**Flag 3 — Lisdexamfetamine "hard ceiling due to the prodrug formulation" is misleading.**

The draft states the 70 mg/day ceiling is a "hard ceiling due to the prodrug formulation." The 70 mg/day limit is the **FDA-approved maximum dose**, not a pharmacologic ceiling inherent to the prodrug mechanism.[8] The prodrug design reduces abuse potential by requiring enzymatic conversion, but it does not create a pharmacokinetic ceiling that prevents higher doses from having additional effect. The JAMA Psychiatry dose-response meta-analysis found that for amphetamines, the dose-response curve plateaus around 30–35 mg/day, suggesting the clinical ceiling is well below 70 mg.[9]

Corrected framing: "Lisdexamfetamine (Vyvanse): FDA max 70 mg/day. The prodrug formulation reduces abuse potential but does not create a pharmacologic ceiling — the 70 mg limit is a regulatory maximum. Notably, dose-response data suggest diminishing symptom benefit beyond approximately 30–35 mg/day for amphetamines, with continued increases in adverse event risk."[9]

---

**Section: PDMP Review (faq_id: pdmp)*****

**Flag 4 — "Quarterly checks at prescription renewal visits are a reasonable standard" lacks evidence support and may understate the obligation.**

The draft recommends quarterly PDMP checks as a "reasonable standard." The ASAM/AAAP guideline recommends checking the PDMP **prior to prescribing** psychostimulant medications (Moderate certainty, Strong Recommendation), without specifying a quarterly interval.[10] The AAFP 2024 review recommends "patient reevaluation at least every 3 months" for stimulant monitoring broadly, but this refers to the full clinical encounter, not specifically PDMP frequency.[4] The CDC 2022 opioid guideline (often used as a benchmark for controlled substance monitoring) recommends PDMP review ideally **before every controlled substance prescription**.[11] New York's I-STOP law mandates PDMP consultation **prior to prescribing** controlled substances in most situations.[12][13]

Corrected framing: "Under New York's I-STOP law, PDMP review is required prior to each prescribing event for controlled substances, not merely quarterly. For stable patients on 90-day prescribing cycles, this effectively means at each renewal. The 'every prescription' standard is the safest default."

**Flag 5 — "New York State requires PDMP review prior to prescribing controlled substances" is correct but should note limited exceptions.**

The I-STOP law does include certain exemptions (e.g., inpatient settings, hospice, certain emergency situations).[12][14] While these exceptions are unlikely to apply to outpatient ADHD management, stating it as an absolute without noting any exceptions could mislead a provider who also prescribes in other settings.

Corrected framing: Minor — add a parenthetical: "New York State requires PDMP review prior to prescribing controlled substances (with limited exceptions for inpatient, hospice, and certain emergency settings)."

---

**Section: Substance Use History (faq_id: sud)*****

**Flag 6 — The SUD section omits the current guideline recommendation to preferentially use extended-release or prodrug formulations in patients with SUD history.**

The 2024 ASAM/AAAP guideline specifically recommends that when prescribing stimulants to patients with co-occurring SUD and ADHD, clinicians should **use extended-release formulations** (Clinical consensus, Strong Recommendation) and maintain monitoring commensurate with risk, including pill counts, drug testing, and more frequent PDMP checks.[15][10] The draft's SUD section discusses documentation but omits this important prescribing guidance, which is directly actionable for primary care.

Corrected framing: Add to the SUD section: "When continuing stimulants in a patient with SUD history, current ASAM/AAAP guidelines recommend preferentially using **extended-release or prodrug formulations** to reduce misuse risk, along with enhanced monitoring (pill counts, urine drug screens, more frequent PDMP checks)."[15]

**Flag 7 — "A patient in sustained, well-documented remission who has been stable on stimulants for years" — the framing implies SUD in remission is straightforward, but guidelines note this remains controversial.**

The ASAM/AAAP guideline explicitly states that "the use of prescription stimulant medications…remains controversial due to the perceived risk of medication misuse and/or development of tolerance and StUD" even in the context of co-occurring ADHD.[10] The guideline recommends that prescribing stimulants to patients with co-occurring StUD should be limited to physicians with addiction medicine or addiction psychiatry expertise, or those with "commensurate training, competencies, and capacity for close patient monitoring".[15][10] This is more restrictive than the draft implies for primary care.

Corrected framing: "A past SUD does not automatically preclude stimulant continuation, but current ASAM/AAAP guidelines suggest that prescribing stimulants in the context of co-occurring SUD ideally involves specialist-level expertise or close specialist collaboration — not primary care acting alone.[15] The e-consult pathway is appropriate here not just for documentation but for genuine clinical guidance."

---

**Section: Treatment Effectiveness (faq_id: efficacy)*****

**Flag 8 — "Formal rating scales…are not expected at every follow-up for established patients" is defensible but oversimplified.**

The ASRS was designed as a screening tool, not a treatment-monitoring instrument.[16][17] However, the AAFP 2024 review recommends "patient reevaluation at least every 3 months" using structured assessment including symptom and function evaluation.[4] While no guideline mandates a formal rating scale at every visit, the draft's framing could discourage any structured measurement, which runs counter to the broader trend toward measurement-based care. The ADHD-RS (ADHD Rating Scale) is used in clinical trials as an outcome measure and can serve a monitoring role.[3]

Corrected framing: "Formal diagnostic rating scales (e.g., ASRS) were designed for screening and initial evaluation, not routine follow-up monitoring. However, brief structured symptom assessment — whether using a short checklist or consistent functional questions — is recommended at each renewal visit to support measurement-based care. The goal is reproducible documentation of treatment response, not a full diagnostic workup."

---

**Section: Diagnostic Basis (faq_id: dx-vibes)*****

**Flag 9 — "Neuropsychological testing is not required for an ADHD diagnosis and is not the standard of care in most clinical settings" is correct but needs nuance.**

This statement is accurate as a general rule. However, the 2024 AAFP review specifically recommends that neuropsychological testing **"should be considered"** when collateral information is lacking, malingering is suspected, or confounding comorbid mental illness is present (Evidence rating C).[4] For the specific scenario described in this FAQ — a patient with a thin chart and no workup — neuropsychological testing may actually be more relevant than the draft implies.

Corrected framing: "Neuropsychological testing is not required for ADHD diagnosis in most cases. However, the AAFP recommends it be considered when collateral information (childhood history, observer reports) is lacking, malingering is suspected, or confounding psychiatric comorbidities are present.[4] For a patient with a thin chart and no prior workup, this threshold may be met."

---

**Section: Functional Concerns (faq_id: functional)*****

**Flag 10 — "Stimulants are contraindicated in patients with…psychosis, or tics" (referenced in the behavioral red flags section via the NEJM source) — the tics contraindication is outdated.**

The 2013 NEJM review cited in the module states stimulants are "contraindicated in patients with hypertension, psychosis, or tics".[18] However, the 2019 AAP guideline and subsequent evidence have softened this position: stimulants may **exacerbate** tics in some patients, but tics are no longer considered an absolute contraindication.[19] The FDA labels for stimulants list tics as a warning/precaution requiring clinical evaluation, not a contraindication.[6][7] The draft's "behavioral red flags" section does not explicitly repeat this claim, but the underlying source is outdated on this point.

No direct correction needed in the current text, but worth noting for the module's broader evidence base.

**Flag 11 — Cardiovascular symptoms section omits blood pressure monitoring as a standard of care.**

The draft lists "palpitations, chest pain, or significant blood pressure elevation at current dose" as red flags but does not mention that **routine blood pressure and heart rate monitoring is recommended for all patients on stimulants**, not just those with symptoms. A 2025 Lancet Psychiatry network meta-analysis of 102 RCTs found that all ADHD medications (stimulants and nonstimulants) increase blood pressure and pulse, and recommends monitoring in all treated patients.[20] The AAFP 2024 review notes stimulants are contraindicated in uncontrolled hypertension.[4]

Corrected framing: Add to the cardiovascular bullet or as a separate note: "Blood pressure and heart rate should be monitored at baseline and at each follow-up visit for all patients on stimulant therapy, not only when symptoms arise."[20][4]

---

**Section: Early Fills (faq_id: early-fills)*****

**Flag 12 — "Lost or stolen Schedule II controlled substances are not replaced as a matter of policy. This is both a regulatory constraint and a risk management position" — this overstates the regulatory component.**

There is no federal DEA regulation that categorically prohibits replacing lost or stolen Schedule II prescriptions. This is typically an **institutional or practice-level policy**, not a regulatory mandate. DEA regulations permit a prescriber to issue a new prescription for a Schedule II substance at their clinical discretion. Some states may have additional restrictions, but characterizing this as a "regulatory constraint" without qualification could mislead providers into believing they are legally prohibited from ever replacing a lost prescription when clinical judgment supports doing so.

Corrected framing: "Replacing lost or stolen Schedule II medications is generally discouraged as a **risk management practice** and is prohibited by many institutional policies. While there is no blanket federal regulation prohibiting replacement, most practices adopt a no-replacement policy to reduce diversion risk. Document the report, check the PDMP, and follow institutional policy."

**Flag 13 — "2+ early fills in 12 months" as a red-flag threshold lacks evidence support.**

The "2+ early fills in 12 months" threshold is presented as a defined standard but does not appear in any published guideline. This is a reasonable institutional policy choice but should be framed as such, not as an evidence-based threshold.

Corrected framing: "There is no consensus guideline threshold for the number of early fills that constitutes a red flag. The '2+ early fills in 12 months' threshold is a reasonable institutional standard — present it as a local policy decision rather than an evidence-based cutoff."

---

**Section: Multi-Agent Requests (faq_id: combo-stim)*****

**Flag 14 — "Combination stimulant therapy (e.g., long-acting amphetamine plus short-acting methylphenidate)" — this specific example is atypical.**

Combination stimulant therapy in specialist practice typically involves a **long-acting and short-acting formulation of the same stimulant class** (e.g., Concerta + IR methylphenidate, or Vyvanse + IR dextroamphetamine), not cross-class combinations (amphetamine + methylphenidate). Cross-class combination is much less common and more controversial. The example given could normalize a practice that most specialists would not endorse as first-line combination therapy.

Corrected framing: "Combination stimulant therapy typically involves a long-acting formulation supplemented by a short-acting 'booster' **of the same class** (e.g., long-acting methylphenidate + IR methylphenidate, or lisdexamfetamine + IR dextroamphetamine). Cross-class combinations (e.g., amphetamine + methylphenidate) are uncommon and require specialist justification."

---

**Summary of highest-priority corrections:**

PrioritySectionIssueReferences**High**Ceiling DoseAdderall IR FDA max is 40 mg/day, not 60 mg; XR evidence supports 20 mg/day[1], [2], [3], [4]**High**Ceiling DoseConcerta FDA max is 72 mg/day, not 60 mg[5], [6]**High**Ceiling DoseLisdexamfetamine ceiling is regulatory, not pharmacologic[7], [8]**High**SUDMissing recommendation for extended-release formulations in SUD patients[9], [10]**High**SUDGuideline restricts stimulant prescribing in SUD to specialist-level expertise[9], [10]**Medium**PDMPI-STOP requires per-prescription check, not quarterly[11], [12], [13]**Medium**FunctionalMissing routine BP/HR monitoring recommendation for all stimulant patients[1], [14]**Medium**Early FillsLost medication "regulatory constraint" overstated — this is institutional policy—**Medium**DiagnosisNeuropsych testing "should be considered" when collateral info is lacking per AAFP[1]**Low**Combo-StimCross-class combination example is atypical; same-class is standard—**Low**EfficacyRating scale guidance should encourage measurement-based care, not discourage scales[1]**Low**Early Fills"2+ early fills" threshold is institutional, not evidence-based—

Would you like to explore the specific evidence on cardiovascular risk monitoring protocols and thresholds for stimulant-treated adults, including the recent long-term CVD outcome data from the 2024 JAMA Psychiatry Swedish cohort study?

### References

1. Dextroamphetamine Saccharate, Amphetamine Aspartate Monohydrate, Dextroamphetamine Sulfate, and Amphetamine Sulfate. Food and Drug Administration. Updated date: 2024-01-12.
2. Dextroamphetamine Saccharate, Amphetamine Aspartate, Dextroamphetamine Sulfate, and Amphetamine Sulfate. Food and Drug Administration. Updated date: 2023-10-13.
3. Dextroamphetamine Saccharate, Amphetamine Aspartate Monohydrate, Dextroamphetamine Sulfate and Amphetamine Sulfate. Food and Drug Administration. Updated date: 2025-03-17.
4. Attention-Deficit/Hyperactivity Disorder in Adults. Olagunju AE, Ghoddusi F. American Family Physician. 2024;110(2):157-166.
5. Amphetamines for Attention Deficit Hyperactivity Disorder (ADHD) in Adults. Castells X, Blanco-Silvente L, Cunill R. The Cochrane Database of Systematic Reviews. 2018;8:CD007813. doi:10.1002/14651858.CD007813.pub3.
6. Methylphenidate Hydrochloride. Food and Drug Administration. Updated date: 2025-01-20.
7. Methylphenidate Hydrochloride. Food and Drug Administration. Updated date: 2026-01-06.
8. LISDEXAMFETAMINE DIMESYLATE. Food and Drug Administration. Updated date: 2024-09-06.
9. Treatment Outcomes With Licensed and Unlicensed Stimulant Doses for Adults With Attention-Deficit/Hyperactivity Disorder: A Systematic Review and Meta-Analysis. Farhat LC, Flores JM, Avila-Quintero VJ, et al. JAMA Psychiatry. 2024;81(2):157-166. doi:10.1001/jamapsychiatry.2023.3985.
10. The ASAM/AAAP Clinical Practice Guideline on the Management of Stimulant Use Disorder. Journal of Addiction Medicine. 2024 May-Jun 01;18(1S Suppl 1):1-56. doi:10.1097/ADM.0000000000001299.
11. CDC Clinical Practice Guideline for Prescribing Opioids for Pain - United States, 2022. Dowell D, Ragan KR, Jones CM, Baldwin GT, Chou R. MMWR. Recommendations and Reports : Morbidity and Mortality Weekly Report. Recommendations and Reports. 2022;71(3):1-95. doi:10.15585/mmwr.rr7103a1.
12. A Survey of Physicians' Perspectives on the New York State Mandatory Prescription Monitoring Program (ISTOP). Blum CJ, Nelson LS, Hoffman RS. Journal of Substance Abuse Treatment. 2016;70:35-43. doi:10.1016/j.jsat.2016.07.013.
13. Impact of New York Prescription Drug Monitoring Program, I-Stop, on Statewide Overdose Morbidity. Brown R, Riley MR, Ulrich L, et al. Drug and Alcohol Dependence. 2017;178:348-354. doi:10.1016/j.drugalcdep.2017.05.023.
14. Decoding New York State's Prescription Monitoring Program. Virani S, Aoun EG, Torres F, et al. Psychiatric Services (Washington, D.C.). 2018;69(9):956-958. doi:10.1176/appi.ps.201800143.
15. Management of Stimulant Use Disorder. Steven Batki MD, Daniel Ciccarone MD MPH, Scott E. Hadland MD MPH, et al. American Academy of Addiction Psychiatry (2023).
16. The World Health Organization Adult Attention-Deficit/Hyperactivity Disorder Self-Report Screening Scale for DSM-5. Ustun B, Adler LA, Rudin C, et al. JAMA Psychiatry. 2017;74(5):520-527. doi:10.1001/jamapsychiatry.2017.0298.
17. Screening for Adult ADHD. Anbarasan D, Kitchin M, Adler LA. Current Psychiatry Reports. 2020;22(12):72. doi:10.1007/s11920-020-01194-9.
18. Adult Attention Deficit–Hyperactivity Disorder. Volkow ND, Swanson JM. The New England Journal of Medicine. 2013;369(20):1935-44. doi:10.1056/NEJMcp1212625.
19. Clinical Practice Guideline for the Diagnosis, Evaluation, and Treatment of Attention-Deficit/Hyperactivity Disorder in Children and Adolescents. Wolraich ML, Hagan JF, Allan C, et al. Pediatrics. 2019;144(4):e20192528. doi:10.1542/peds.2019-2528.
20. Comparative Cardiovascular Safety of Medications for Attention-Deficit Hyperactivity Disorder in Children, Adolescents, and Adults: A Systematic Review and Network Meta-Analysis. Farhat LC, Lannes A, Del Giovane C, et al. The Lancet. Psychiatry. 2025;12(5):355-365. doi:10.1016/S2215-0366(25)00062-8.

---

## Shared bundle prompt template

Use this wrapper for Bundles 1–8. Paste the bundle's claim list into the `[claims]` slot.

```
I'm reviewing a primary care decision-support tool for managing adult patients
inherited on stimulant therapy for ADHD. I need to verify a set of related
clinical claims against current evidence and guidelines.

For each claim below, please tell me:
  1. Is this supported by current evidence, guidelines (APA, AACAP, FDA,
     state regulatory bodies), or standard of care?
  2. The specific source/citation (guideline name, year, relevant section).
  3. Any nuance, exception, or recent update (2022+) that should modify it.
  4. If the claim is incorrect or oversimplified, what is the accurate version?

Do not assume the claims are correct. I want genuine pushback on anything
that's outdated, unsupported, or controversial.

Claims:
[paste bundle claims here]
```

---

## Bundle 1 — Regulatory & Pharmacology  **(PILOT FIRST)**

Highest-stakes, most black-and-white facts. Run this first to calibrate the prompt wording.

```
- New York State requires PDMP review prior to prescribing controlled substances (legal obligation, not preference).
- NY Schedule II controlled substances cannot be post-dated or filled early beyond the state dispensing window, regardless of reason.
- Lost or stolen Schedule II controlled substances are not replaced as a matter of policy (regulatory constraint, not provider discretion).
- FDA maximum adult daily doses: amphetamine salts (Adderall) 60 mg/day; methylphenidate 60 mg/day; lisdexamfetamine (Vyvanse) 70 mg/day.
- Doses above 40 mg/day amphetamine salts in primary care warrant documented rationale.
```

**Bundle 1 findings:**

_(paste OE response here; extract into tracker table below)_
Here is a claim-by-claim analysis against current evidence:

---

**Claim 1: "New York State requires PDMP review prior to prescribing controlled substances (legal obligation, not preference)."**

**Verdict: Largely accurate, but needs qualification.** New York's I-STOP law (Internet System for Tracking Over-Prescribing), enacted in 2013, mandates that prescribers consult the PDMP registry before prescribing controlled substances.[1][2] However, the law includes **limited exceptions** — notably for inpatient settings, hospice, and certain emergency situations. A survey of physicians at one academic medical center found that only 83.1% were aware the mandate applied "in almost all situations," highlighting the importance of specifying these exceptions.[1] The claim should be amended to: "New York State requires PDMP review prior to prescribing controlled substances in most outpatient settings (with limited exceptions for inpatient, hospice, and certain emergency situations). This is a legal obligation under I-STOP, not a preference."[1][3][2]

---

**Claim 2: "NY Schedule II controlled substances cannot be post-dated or filled early beyond the state dispensing window, regardless of reason."**

**Verdict: Partially supported but imprecise — the specific "dispensing window" is not defined in the medical literature reviewed, and the claim conflates two distinct regulatory concepts.** At the federal level, the Controlled Substances Act does not permit refills of Schedule II prescriptions, but it does allow prescribers to issue up to three sequential 90-day prescriptions with future "do not fill before" dates (21 CFR §1306.12).[4] Whether New York State restricts this federal allowance further is a matter of state pharmacy law (NY Education Law §6810, NY Public Health Law Article 33) rather than medical literature. The claim as written — that Schedule II prescriptions "cannot be post-dated" — appears to **contradict federal regulations** that explicitly permit post-dating with "do not fill before" dates. The early-fill dispensing window (typically pharmacy- or insurer-driven, often 2–3 days before the next fill is due) is largely a **pharmacy/insurance policy**, not a state statute.

Corrected framing: "Federal law prohibits refills of Schedule II controlled substances but permits prescribers to issue multiple sequential prescriptions with 'do not fill before' dates. Early-fill restrictions are primarily driven by pharmacy and insurance policies rather than state statute. Providers should verify their institution's specific policies and any applicable NY pharmacy board guidance."

---

**Claim 3: "Lost or stolen Schedule II controlled substances are not replaced as a matter of policy (regulatory constraint, not provider discretion)."**

**Verdict: Incorrect characterization — this is institutional/practice policy, not a federal or state regulatory prohibition.** There is **no federal DEA regulation** that categorically prohibits a prescriber from issuing a new prescription for a Schedule II substance when a patient reports a lost or stolen medication. Under the Controlled Substances Act, a prescriber may issue a new Schedule II prescription at their clinical discretion for a legitimate medical purpose.[4][5] The DEA's framework requires that prescriptions be issued "for a legitimate medical purpose by an individual practitioner acting in the usual course of his professional practice," but does not specifically address lost/stolen medication replacement as prohibited.[5]

Corrected framing: "Most practices and institutions adopt a **no-replacement policy** for lost or stolen Schedule II medications as a risk management measure to reduce diversion risk. This is an institutional policy decision, not a federal or state regulatory prohibition. Prescribers retain clinical discretion to issue a new prescription if medically indicated, though doing so — particularly repeatedly — may attract regulatory scrutiny. Document the report, check the PDMP, and follow institutional policy."

---

**Claim 4: "FDA maximum adult daily doses: amphetamine salts (Adderall) 60 mg/day; methylphenidate 60 mg/day; lisdexamfetamine (Vyvanse) 70 mg/day."**

**Verdict: Two of three are incorrect or incomplete.**

- **Amphetamine salts (Adderall): Incorrect.** The FDA-approved label for Adderall IR (immediate-release tablets) states that "only in rare cases will it be necessary to exceed a total of **40 mg per day**." The Adderall XR (extended-release capsules) label recommends **20 mg/day** as the standard adult dose, with clinical trial data showing "there was not adequate evidence that doses greater than 20 mg/day conferred additional benefit." The AAFP 2024 review lists IR max at 40 mg/day and ER max at 60 mg/day — these are formulation-specific, not interchangeable. The Cochrane review similarly cites the FDA-approved range for MAS as 5–40 mg/day. Stating a blanket "60 mg/day" for "Adderall" without specifying formulation is misleading.[6][7][8][9]
- **Methylphenidate: Incomplete.** While 60 mg/day is correct for IR, SR, and most ER formulations, **Concerta (OROS extended-release) has an FDA-approved maximum of 72 mg/day** for adults. A module stating "60 mg/day" as the ceiling could cause a provider to inappropriately flag a patient on Concerta 72 mg.[8]
- **Lisdexamfetamine (Vyvanse) 70 mg/day: Correct.** The FDA label confirms a maximum recommended dose of 70 mg/day for ADHD, with dose reductions for renal impairment (max 50 mg/day for severe renal impairment, max 30 mg/day for ESRD).[10]

Corrected framing:

MedicationFormulationFDA Max (Adults)Key NuanceReferencesMixed amphetamine salts (Adderall)IR tablets**40 mg/day**Label states "only in rare cases" exceed 40 mg[1]Mixed amphetamine salts (Adderall XR)ER capsules20 mg/day recommended; up to 60 mg studiedNo evidence doses >20 mg confer additional benefit[2]MethylphenidateIR/SR/most ER**60 mg/day**—[3]Methylphenidate (Concerta)OROS ER**72 mg/day**Unique formulation; higher ceiling than other MPH products[3]Lisdexamfetamine (Vyvanse)Capsules/chewable**70 mg/day**Reduce to 50 mg for severe renal impairment[4]

```
csv
Medication,Formulation,FDA Max (Adults),Key Nuance,References
Mixed amphetamine salts (Adderall),IR tablets,<strong>40 mg/day</strong>,"Label states ""only in rare cases"" exceed 40 mg",[1]
Mixed amphetamine salts (Adderall XR),ER capsules,20 mg/day recommended; up to 60 mg studied,No evidence doses >20 mg confer additional benefit,[2]
Methylphenidate,IR/SR/most ER,<strong>60 mg/day</strong>,—,[3]
Methylphenidate (Concerta),OROS ER,<strong>72 mg/day</strong>,Unique formulation; higher ceiling than other MPH products,[3]
Lisdexamfetamine (Vyvanse),Capsules/chewable,<strong>70 mg/day</strong>,Reduce to 50 mg for severe renal impairment,[4]
```

The JAMA Psychiatry dose-response meta-analysis (2024) adds important context: for amphetamines, the dose-response curve for symptom reduction plateaus around **30–35 mg/day**, with continued increases in adverse events at higher doses. Clinical practice guidelines generally recommend higher ceilings than FDA labels (e.g., up to 100 mg/day for methylphenidate), but the evidence for benefit above FDA-approved doses is limited.[11]

---

**Claim 5: "Doses above 40 mg/day amphetamine salts in primary care warrant documented rationale."**

**Verdict: Reasonable as a practice standard, but the threshold should be formulation-specific.** For Adderall IR, 40 mg/day is the FDA-labeled maximum, so any dose at or above this level already represents the ceiling — not a threshold for "heightened documentation." For Adderall XR, the FDA label recommends 20 mg/day with no evidence of additional benefit above that dose, meaning the documentation threshold arguably should be[6] **lower** (above 20 mg/day) for the ER formulation.[7] The AACAP practice parameter (2002) similarly cites 40 mg as the maximum for DEX/AMP in adults and recommends that clinicians using higher doses "should clearly document that such symptoms could not be controlled at lower doses and the higher doses are not producing side effects."[12]

Corrected framing: "For Adderall IR, 40 mg/day is the FDA maximum — doses at this level already warrant documented rationale. For Adderall XR, the evidence-supported dose is 20 mg/day; doses above this warrant documentation of rationale even though the label permits up to 60 mg in clinical trials. The AACAP recommends that any dose above the standard maximum be accompanied by documentation that lower doses were inadequate and that higher doses are not producing adverse effects."[12][7][6]

---

**Summary of corrections needed:**

ClaimVerdictKey CorrectionReferencesPDMP review required (NY)Mostly accurateAdd exceptions (inpatient, hospice, emergency)[1], [2]Schedule II cannot be post-dated/filled earlyPartially incorrectFederal law permits post-dating with "do not fill before" dates; early-fill windows are pharmacy/insurance policy[3]Lost/stolen Schedule II not replaced (regulatory)**Incorrect**No federal prohibition; this is institutional policy, not regulation[3], [4]Adderall FDA max 60 mg/day**Incorrect**IR max = 40 mg/day; XR recommended = 20 mg/day (up to 60 mg studied)[5], [6], [7]Methylphenidate FDA max 60 mg/day**Incomplete**Concerta (OROS) max = 72 mg/day[5]Vyvanse FDA max 70 mg/dayCorrectNote renal dose adjustments[8]>40 mg/day amphetamine salts needs documentationReasonable but impreciseThreshold should be formulation-specific; XR threshold is arguably 20 mg/day[6], [7], [9]

```
csv
Claim,Verdict,Key Correction,References
PDMP review required (NY),Mostly accurate,"Add exceptions (inpatient, hospice, emergency)",[1-2]
Schedule II cannot be post-dated/filled early,Partially incorrect,"Federal law permits post-dating with ""do not fill before"" dates; early-fill windows are pharmacy/insurance policy",[3]
Lost/stolen Schedule II not replaced (regulatory),<strong>Incorrect</strong>,"No federal prohibition; this is institutional policy, not regulation",[3-4]
Adderall FDA max 60 mg/day,<strong>Incorrect</strong>,IR max = 40 mg/day; XR recommended = 20 mg/day (up to 60 mg studied),[5-7]
Methylphenidate FDA max 60 mg/day,<strong>Incomplete</strong>,Concerta (OROS) max = 72 mg/day,[5]
Vyvanse FDA max 70 mg/day,Correct,Note renal dose adjustments,[8]
>40 mg/day amphetamine salts needs documentation,Reasonable but imprecise,Threshold should be formulation-specific; XR threshold is arguably 20 mg/day,"[6-7, 9]"
```

Would you like to explore how clinical practice guideline dose recommendations (e.g., NICE, CADDRA, or APA) compare to FDA-labeled maximums for adult ADHD stimulants, particularly the evidence basis for off-label dose escalation above FDA ceilings?

### References

1. A Survey of Physicians' Perspectives on the New York State Mandatory Prescription Monitoring Program (ISTOP). Blum CJ, Nelson LS, Hoffman RS. Journal of Substance Abuse Treatment. 2016;70:35-43. doi:10.1016/j.jsat.2016.07.013.
2. Impact of a Mandatory Prescription Drug Monitoring Program on Prescription of Opioid Analgesics by Dentists. Rasubala L, Pernapati L, Velasquez X, Burk J, Ren YF. PloS One. 2015;10(8):e0135957. doi:10.1371/journal.pone.0135957.
3. Decoding New York State's Prescription Monitoring Program. Virani S, Aoun EG, Torres F, et al. Psychiatric Services (Washington, D.C.). 2018;69(9):956-958. doi:10.1176/appi.ps.201800143.
4. Regulation of Controlled Substance Prescribing: An Overview for Certified Nurse-Midwives and Certified Midwives. Osborne K. Journal of Midwifery & Women's Health. 2017;62(3):341-347. doi:10.1111/jmwh.12615.
5. Reducing Risk of Federal Investigation or Prosecution for Prescribing Controlled Addiction Medications for Legitimate Medical Purposes. American Society of Addiction Medicine (2024).
6. Dextroamphetamine Saccharate, Amphetamine Aspartate Monohydrate, Dextroamphetamine Sulfate, and Amphetamine Sulfate. Food and Drug Administration. Updated date: 2024-01-12.
7. Dextroamphetamine Saccharate, Amphetamine Aspartate, Dextroamphetamine Sulfate, and Amphetamine Sulfate. Food and Drug Administration. Updated date: 2023-10-13.
8. Attention-Deficit/Hyperactivity Disorder in Adults. Olagunju AE, Ghoddusi F. American Family Physician. 2024;110(2):157-166.
9. Amphetamines for Attention Deficit Hyperactivity Disorder (ADHD) in Adults. Castells X, Blanco-Silvente L, Cunill R. The Cochrane Database of Systematic Reviews. 2018;8:CD007813. doi:10.1002/14651858.CD007813.pub3.
10. Vyvanse. Food and Drug Administration. Updated date: 2025-10-01.
11. Treatment Outcomes With Licensed and Unlicensed Stimulant Doses for Adults With Attention-Deficit/Hyperactivity Disorder: A Systematic Review and Meta-Analysis. Farhat LC, Flores JM, Avila-Quintero VJ, et al. JAMA Psychiatry. 2024;81(2):157-166. doi:10.1001/jamapsychiatry.2023.3985.
12. Practice Parameter for the Use of Stimulant Medications in the Treatment of Children, Adolescents, and Adults. Greenhill LL, Pliszka S, Dulcan MK, et al. Journal of the American Academy of Child and Adolescent Psychiatry. 2002;41(2 Suppl):26S-49S. doi:10.1097/00004583-200202001-00003.
---

## Bundle 2 — PDMP Red Flags

```
- Multiple prescribers for stimulants within 12 months without documented coordination is a concerning pattern.
- Fills at 3+ pharmacies without geographic/insurance justification is a concerning pattern.
- Concurrent stimulants + opioids without documented pain rationale is a concerning pattern.
- Quantity dispensed mismatched to any single prescriber's authorization suggests supplemental sourcing (diversion risk).
```

**Bundle 2 findings:**

_(paste OE response here)_

---

## Bundle 3 — Adult ADHD Diagnostic Standards

```
- Neuropsychological testing is NOT required for an adult ADHD diagnosis and is not standard of care in most clinical settings.
- A reasonable adult ADHD workup consists of: (a) a validated rating scale such as the Adult ADHD Self-Report Scale (ASRS), (b) a structured clinical interview addressing symptom onset, duration, and functional impairment across settings, and (c) consideration of differential diagnoses including anxiety, mood disorders, sleep disorders, and thyroid disease.
- The ASRS and Conners Adult ADHD Rating Scale are appropriate for initial evaluation but are NOT expected at every follow-up visit for established patients.
- For established adult ADHD patients on stimulants, brief structured questions covering functional domains, side effects, and adherence are sufficient for ongoing monitoring.
```

**Bundle 3 findings:**

_(paste OE response here)_

---

## Bundle 4 — Stimulants in Patients with SUD History

```
- A past substance use disorder in sustained, documented remission is NOT an automatic disqualifier for stimulant continuation in an inherited patient.
- Minimum documentation for continuing stimulants in a patient with SUD history includes: noted awareness of the history, explicit consideration in the prescribing decision, and a monitoring plan (PDMP review at renewal + periodic urine drug screen).
- Cannabis use alone does not automatically disqualify stimulant continuation, but heavy or problematic cannabis use escalates documentation requirements to the same level as other SUD history.
```

**Bundle 4 findings:**

_(paste OE response here)_

---

## Bundle 5 — Stimulant Safety & Differential Diagnosis

```
- Stimulants can worsen anxiety disorders.
- Stimulants can destabilize mood in bipolar disorder, particularly bipolar type II.
- Stimulants can worsen trauma-related hyperarousal in PTSD.
- Cardiovascular symptoms (palpitations, chest pain, significant blood pressure elevation) at current stimulant dose warrant reassessment before continuing.
- Anxiety disorders, bipolar II, and PTSD significantly overlap with ADHD symptom profiles and are common diagnostic mimics in adults.
```

**Bundle 5 findings:**

_(paste OE response here)_

---

## Bundle 6 — Early Fill Patterns

```
- A single early-fill request more than 5 days early is worth a conversation with the patient.
- A pattern of 2+ early fills more than 5 days early within 12 months warrants documentation and possible escalation, including urine drug screening.
- What is the evidence base or guideline origin for using a "5-day" threshold in adult stimulant prescribing? Is this a CDC-derived number, an insurer rule, a state rule, or clinical convention?
```

**Bundle 6 findings:**

_(paste OE response here)_

---

## Bundle 7 — Inheriting Stimulant Patients (Functional Assessment)

```
- When a PCP inherits an adult patient already on stimulants for ADHD, the appropriate standard is an assessment of current functional status, NOT a re-validation of the original diagnosis.
- A documented 5-year stable course on stimulants with demonstrated functional benefit is meaningful clinical evidence supporting continuation, even if the original diagnostic chart is thin.
- Is there a recognized standard-of-care framework (from APA, AAFP, AACAP, or state licensing boards) for PCPs inheriting established adult ADHD patients on stimulants?
```

**Bundle 7 findings:**

_(paste OE response here)_

---

## Bundle 8 — Combination / Booster Stimulant Regimens

```
- Combination stimulant therapy (e.g., a long-acting amphetamine plus a short-acting methylphenidate, or a short-acting "booster" added to an extended-release formulation) is used in specialist practice for severe ADHD but is outside primary care initiation scope.
- Initiating a combination or booster stimulant regimen in primary care without specialist documentation is not consistent with standard of care.
- Restarting a previously prescribed combination regimen that is documented in prior records is lower risk than initiating a new combination regimen.
```

**Bundle 8 findings:**

_(paste OE response here)_

---

## Claim-level tracker

One row per verifiable claim. `FAQ location` uses `faqs.<faq_id>.q<n>` where `<n>` is the 1-indexed position of the question within `items[]` in `modules/adhd.json`. `ref_id` is the short id you'll use in the `references[]` array and in `[ref:X]` markers in the prose.

Populated from Meta-pass (MP) and Bundle 1 (B1) results. Rows with `—` are pending the bundle noted in the Action column. Rows 30–35 added post-OE based on net-new claims surfaced by the review.

| # | Claim | FAQ location | OE verdict | ref_id | Action / Source |
|---|-------|--------------|------------|--------|-----------------|
| 1 | NY State mandates PDMP review before CS prescribing | faqs.pdmp.q1 | Verified with nuance | istop-blum2016, istop-virani2018 | Soften language — add "(with limited exceptions: inpatient, hospice, emergency)" (B1 Claim 1 + MP Flag 5) |
| 2 | PDMP red flag: multiple prescribers in 12 months | faqs.pdmp.q2 | — | — | _Bundle 2 pending_ |
| 3 | PDMP red flag: 3+ pharmacies without geographic reason | faqs.pdmp.q2 | — | — | _Bundle 2 pending_ |
| 4 | PDMP red flag: concurrent stimulants + opioids | faqs.pdmp.q2 | — | — | _Bundle 2 pending_ |
| 5 | PDMP red flag: dose quantity mismatch (diversion) | faqs.pdmp.q2 | — | — | _Bundle 2 pending_ |
| 6 | Past SUD is not an automatic disqualifier | faqs.sud.q1 | Verified with nuance | asam-aaap-2024 | Soften language — pair with Row 31 (specialist-collaboration caveat) (MP Flag 7) |
| 7 | SUD-aware documentation requires monitoring plan | faqs.sud.q2 | — | — | _Bundle 4 pending; see Row 30 addition (ER/prodrug formulation rec)_ |
| 8 | Cannabis use alone does not disqualify | faqs.sud.q3 | — | — | _Bundle 4 pending_ |
| 9 | Inherited patients: assess current function, not re-validate dx | faqs.efficacy.q1 | — | — | _Bundle 7 pending_ |
| 10 | Rating scales not expected at every follow-up | faqs.efficacy.q3 | Verified with nuance | aafp-2024, asrs-ustun2017 | Soften language — encourage brief structured symptom/function assessment at each renewal (MP Flag 8) |
| 11 | Single early fill >5 days early → conversation | faqs.early-fills.q1 | — | — | _Bundle 6 pending_ |
| 12 | Pattern of 2+ early fills in 12 months → escalation | faqs.early-fills.q1 | Verified with nuance | — (institutional standard) | Soften language — frame as institutional policy, not evidence-based cutoff (MP Flag 13) |
| 13 | NY Schedule II cannot be filled early beyond window | faqs.early-fills.q2 | Needs revision | cfr-1306-12, nysmidwife-osborne2017 | Rewrite per OE — federal law permits post-dating with "do not fill before" dates; early-fill limit is pharmacy/insurer policy (B1 Claim 2) |
| 14 | Lost/stolen Schedule II not replaced as policy | faqs.early-fills.q3 | Needs revision | asam-risk2024, nysmidwife-osborne2017 | Rewrite per OE — institutional policy, not federal/state regulation (B1 Claim 3 + MP Flag 12) |
| 15 | Neuropsych testing not required / not SoC | faqs.dx-vibes.q2 | Verified with nuance | aafp-2024 | Soften language — pair with Row 33 (AAFP "should be considered" carve-out) (MP Flag 9) |
| 16 | Reasonable workup: ASRS + structured interview + differentials | faqs.dx-vibes.q2 | — | — | _Bundle 3 pending_ |
| 17 | 5-yr stable course is meaningful evidence despite thin chart | faqs.dx-vibes.q3 | — | — | _Bundle 7 pending_ |
| 18 | FDA max: amphetamine salts 60 mg/day | faqs.ceiling-dose.q1 | **Disproved** | fda-adderall-ir, fda-adderall-xr, aafp-2024, cochrane-castells2018, jama-psych-farhat2024 | Rewrite per OE — IR max = 40 mg/day; XR recommended = 20 mg/day. Farhat 2024 adds dose-response plateau at 30–35 mg/day (ED95=30) for amphetamines; unlicensed doses offer no added symptom benefit. Use CSV T1 from B1 Claim 4 (MP Flag 1 + FA-A) |
| 19 | FDA max: methylphenidate 60 mg/day | faqs.ceiling-dose.q1 | Needs revision | fda-methylphenidate, fda-concerta, aafp-2024, jama-psych-farhat2024 | Rewrite per OE — Concerta (OROS ER) = 72 mg/day. Farhat 2024 ED95 for MPH = 72.5 mg/day, so FDA Concerta ceiling is well-calibrated to evidence; doses above offer small incremental gain with doubled AE-dropout risk (MP Flag 2 + FA-A) |
| 20 | FDA max: lisdexamfetamine 70 mg/day | faqs.ceiling-dose.q1 | Verified with nuance | fda-vyvanse, jama-psych-farhat2024 | Soften language — drop "hard ceiling due to prodrug" framing (regulatory, not pharmacologic); Farhat amphetamine plateau at 30–35 mg/day means 70 mg is well above evidence-based ceiling; see Row 35 for renal adjustment (B1 Claim 4 + MP Flag 3 + FA-A) |
| 21 | Amphetamine salts >40 mg/day in PCP warrants documented rationale | faqs.ceiling-dose.q1 | Verified with nuance | aacap-greenhill2002, fda-adderall-xr, jama-psych-farhat2024 | Rewrite per OE — make threshold formulation-specific: IR>40, XR>20. Use "Recommended module language" prose from FA-A line ~640 as source draft; cite Row 36 dose-response evidence (B1 Claim 5 + FA-A) |
| 22 | Stimulants can worsen anxiety | faqs.functional.q1 | — | — | _Bundle 5 pending_ |
| 23 | CV symptoms at current dose warrant reassessment | faqs.functional.q1 | Verified | lancet-psych-farhat2025, aafp-2024, nejm-cortese2020 | Add [ref:X] marker — FA-B supplies specific action thresholds (HR>120, SBP≥140/90); see Rows 32, 41, 42 (MP Flag 11 + FA-B §2) |
| 24 | Stimulants can destabilize bipolar II | faqs.functional.q2 | — | — | _Bundle 5 pending_ |
| 25 | Stimulants can worsen PTSD hyperarousal | faqs.functional.q2 | — | — | _Bundle 5 pending_ |
| 26 | Anxiety/bipolar II/PTSD common ADHD mimics in adults | faqs.functional.q2 | — | — | _Bundle 5 pending_ |
| 27 | Combination stimulant therapy outside PCP initiation scope | faqs.combo-stim.q1 | Verified with nuance | — (clinical convention); see Row 37 for NICE shared-care analogue | Rewrite per OE — change example to same-class (long + short-acting MPH, or Vyvanse + IR dextroamphetamine), not cross-class; Row 37 offers international "specialist initiates, PC continues" framing that validates module's inherited-patient premise (MP Flag 14 + FA-A) |
| 28 | Booster regimens require specialist sign-off in PCP | faqs.combo-stim.q2 | — | — | _Bundle 8 pending_ |
| 29 | Restarting documented prior combo regimen is lower risk | faqs.combo-stim.q3 | — | — | _Bundle 8 pending_ |
| 30 | **NEW:** ASAM/AAAP — prefer ER/prodrug stimulant formulations in patients with SUD history | addition → faqs.sud.q2 | Verified | asam-aaap-2024 | Add new content — actionable prescribing guidance currently missing (MP Flag 6) |
| 31 | **NEW:** ASAM/AAAP — stimulant prescribing in co-occurring SUD ideally specialist-led or close specialist collaboration | addition → faqs.sud.q1 | Verified | asam-aaap-2024 | Add new content — paired with Row 6 softening; reframes e-consult as clinical guidance, not documentation (MP Flag 7) |
| 32 | **NEW:** Routine BP/HR monitoring at baseline + each follow-up for ALL stimulant patients | addition → faqs.functional.q1 | Verified | lancet-psych-farhat2025, aafp-2024, nejm-cortese2020 | Add new content — FA-B supplies specific cadence (Row 41), action thresholds (Row 42), and exam/history triggers (Rows 38–40); this row is the umbrella claim (MP Flag 11 + FA-B §2) |
| 33 | **NEW:** AAFP — neuropsych testing "should be considered" when collateral lacking, malingering suspected, or comorbid MH | addition → faqs.dx-vibes.q2 | Verified | aafp-2024 | Add new content — paired with Row 15 softening (MP Flag 9) |
| 34 | **NEW (missed in v1):** Quarterly PDMP checks are a reasonable standard (existing module text) | faqs.pdmp.q1 | Needs revision | istop-blum2016, asam-aaap-2024, cdc-opioid-2022 | Rewrite per OE — I-STOP requires per-prescription check; "quarterly" understates obligation (MP Flag 4) |
| 35 | **NEW:** Lisdexamfetamine renal dose adjustments — 50 mg/day severe renal, 30 mg/day ESRD | addition → faqs.ceiling-dose.q1 | Verified | fda-vyvanse | Add new content — missing renal nuance for PCPs managing CKD patients (B1 Claim 4) |
| 36 | **NEW (FA-A):** Farhat 2024 dose-response — MPH shows continued but diminishing gains above 60 mg/day with **doubled AE-dropout risk** (OR 2.02); amphetamines **plateau at 30–35 mg/day** (ED95=30) with no unlicensed-dose benefit | new FAQ or addition to faqs.ceiling-dose.q1 | Verified | jama-psych-farhat2024 | Add new content — evidence basis for "above FDA max is not benign" framing; anchors Row 21 rewrite. Consider dedicated FAQ "What does the evidence say about doses above FDA labels?" |
| 37 | **NEW (FA-A):** NICE NG87 shared-care model — **specialist initiates, primary care continues under shared-care agreement**; only major guideline formally delineating provider-type scope for adult ADHD | contextual framing (possibly new FAQ on scope) | Verified | bjgp-price2024, bmc-asherson2022, nice-ng87 | Add new content — validates module's inherited-patient premise; international comparator supports PC-continues-specialist-initiates framing of Row 27 |
| 38 | **NEW (FA-B §1):** CV baseline — use AHA/ACC hypertension staging (no ADHD-specific BP cutoff). Stage 1 (130–139/80–89): monitor closely; Stage 2 (≥140/90): defer initiation until controlled; hypertensive crisis (≥180/120): absolute contraindication. FDA labels contraindicate stimulants in "moderate to severe hypertension" | addition → faqs.functional.q1 | Verified | aafp-2024, fda-adderall-xr, jacc-torresacosta2020 | Add new content — paired with Row 32; supplies numeric thresholds module currently lacks (FA-B §1) |
| 39 | **NEW (FA-B §1):** Baseline ECG is NOT routinely required for adults starting/inheriting stimulants; obtain only when history or exam suggests cardiac disease | addition → faqs.functional.q1 | Verified | aafp-2024, fda-adderall-xr, lancet-thapar2016, aap-wolraich2019 | Add new content — counters a common misperception; documents standard-of-care position explicitly (FA-B §1) |
| 40 | **NEW (FA-B §1):** Personal/family cardiac history triggers for pre-prescribing cardiology workup — personal (structural heart dz, cardiomyopathy, arrhythmia, CAD, prior MI, WPW); family (sudden death, ventricular arrhythmia, HCM, long QT); symptoms (exertional chest pain, unexplained syncope, exertional dyspnea, palpitations) | addition → faqs.functional.q1 | Verified | fda-adderall-xr, aap-wolraich2019, ecap-lee2026 | Add new content — specific triage checklist usable at the inheritance visit (FA-B §1) |
| 41 | **NEW (FA-B §2):** CV monitoring cadence — baseline + after each dose change + at minimum every 6 months for stable patients; every 3 months for CV risk factors or borderline readings | addition → faqs.functional.q1 | Verified | nejm-cortese2020, fda-adderall-xr, nejm-volkow2013 | Add new content — paired with Row 32 umbrella claim; provides the "every 6 months" anchor (FA-B §2) |
| 42 | **NEW (FA-B §2):** CV action thresholds — sustained resting HR >120 bpm OR SBP consistently ≥140/90 on two occasions → dose reduction + specialist referral. Thresholds derive from NICE/European ADHD Guidelines Group (Cortese 2020), **pediatric-derived and extrapolated to adults** — state the caveat | addition → faqs.functional.q1 | Verified with nuance | nejm-cortese2020 | Add new content — paired with Row 23; module must flag the pediatric-extrapolation caveat explicitly (FA-B §2) |
| 43 | **NEW (FA-B §2):** ABPM is NOT standard ADHD monitoring but may be useful for equivocal office readings (distinguishing stimulant-attributable from white-coat HTN); emerging-evidence framing | addition → faqs.functional.q1 | Verified with nuance | jch-cluett2021, eneuropsych-buitelaar2022 | Add new content — use selectively; flag evidence as limited (FA-B §2) |
| 44 | **NEW (FA-B §3):** Long-term CVD risk — Zhang 2024 Swedish cohort (N=278,027; 14-yr f/u): ~4%/yr increased CVD risk during first 3 years, then plateau; >5-yr AOR 1.23 (95% CI 1.12–1.36); driven by hypertension (AOR 1.80) and arterial disease (AOR 1.65); **NO** increased risk of arrhythmia, HF, IHD, or stroke; significant only at ≥1.5× DDD (MPH ≥45 mg/day) | new content — candidate for dedicated FAQ on long-term risk | Verified | jama-psych-zhang2024, jacc-holt2024, jamaopen-zhang2022 | Add new content — supports patient counseling on "modest incremental CVD risk, primarily BP-mediated, dose-dependent." State explicitly: observational data, cannot establish causation (FA-B §3) |
| 45 | **NEW (FA-B §4):** Switching to a nonstimulant does NOT eliminate CV risk — Farhat 2025 shows no significant difference between stimulants and atomoxetine/viloxazine on BP or HR effects | addition → faqs.functional.q1 | Verified | lancet-psych-farhat2025, jamaopen-oliva2025 | Add new content — clinically important corrective to a common clinician assumption (FA-B §4) |
| 46 | **NEW (FA-B §4):** Guanfacine is the only ADHD agent that DECREASES BP/HR (adult: SBP −10.1, DBP −7.73 mmHg, HR −6.83 bpm) — potential option when CV concerns limit stimulant use | scope TBD — addition to faqs.functional.q1 or cross-module pointer | Verified | lancet-psych-farhat2025 | Add new content — may be out of scope for an inherited-stimulant module; consider pointer to a future ADHD-alternatives module (FA-B §4) |
| 47 | **NEW (FA-B §2/§4):** 5–15% of patients experience substantial BP/HR increases beyond the small group-level averages — outlier responses justify monitoring EVERY patient, not just those with symptoms | addition → faqs.functional.q1 | Verified | fda-adderall-xr, aap-wolraich2019, lancet-psych-farhat2025 | Add new content — anchor for Row 32 rationale; transforms "routine monitoring" from convention into evidence-grounded practice (FA-B §2, §4) |
| 48 | **NEW (FA-B §4):** No RCT cardiovascular data exists at ≥52 weeks; all long-term ADHD CV evidence is observational (cohort/case-control); only 4 RCTs reach 24 weeks | meta-caveat — module should state explicitly | Verified | lancet-psych-farhat2025 | Add new content — important evidence-limit disclosure; aligns with OE's guidance to flag thin-evidence areas explicitly (FA-B §4) |

**Verdict values:** `Verified` / `Verified with nuance` / `Needs revision` / `Disproved` / `No evidence found`
**Action values:** `No change` / `Soften language` / `Add [ref:X] marker` / `Rewrite per OE` / `Add new content` / `Remove claim`

**Status summary:** 32 of 48 rows resolved (12 MP/B1-addressed + 6 MP/B1 net-new + 1 missed-claim recovered + 2 FA-A net-new + 11 FA-B net-new). 16 rows still pending Bundles 2–8. Zero rows are "No evidence found" — OE continues to produce specific citations with pushback.

---

## References staging (fills `adhd.json` references[] later)

As OE returns citations, capture them here with the `ref_id` that matches the tracker table. This becomes the `references[]` array in `adhd.json` once verification is complete. URLs that end in `doi.org/...` are deterministic from DOI; FDA label URLs are marked TBD (need manual lookup on accessdata.fda.gov).

| ref_id | citation | url | accessed |
|--------|----------|-----|----------|
| istop-blum2016 | Blum CJ, Nelson LS, Hoffman RS. A Survey of Physicians' Perspectives on the New York State Mandatory Prescription Monitoring Program (ISTOP). J Subst Abuse Treat. 2016;70:35-43. | https://doi.org/10.1016/j.jsat.2016.07.013 | 2026-04-22 |
| istop-virani2018 | Virani S, Aoun EG, Torres F, et al. Decoding New York State's Prescription Monitoring Program. Psychiatr Serv. 2018;69(9):956-958. | https://doi.org/10.1176/appi.ps.201800143 | 2026-04-22 |
| istop-brown2017 | Brown R, Riley MR, Ulrich L, et al. Impact of New York Prescription Drug Monitoring Program, I-Stop, on Statewide Overdose Morbidity. Drug Alcohol Depend. 2017;178:348-354. | https://doi.org/10.1016/j.drugalcdep.2017.05.023 | 2026-04-22 |
| cfr-1306-12 | 21 CFR §1306.12 — Schedule II prescription refill / sequential prescription rules (via Osborne 2017). | TBD (ecfr.gov) | 2026-04-22 |
| nysmidwife-osborne2017 | Osborne K. Regulation of Controlled Substance Prescribing: An Overview for Certified Nurse-Midwives and Certified Midwives. J Midwifery Womens Health. 2017;62(3):341-347. | https://doi.org/10.1111/jmwh.12615 | 2026-04-22 |
| asam-risk2024 | American Society of Addiction Medicine. Reducing Risk of Federal Investigation or Prosecution for Prescribing Controlled Addiction Medications for Legitimate Medical Purposes. 2024. | TBD (asam.org) | 2026-04-22 |
| fda-adderall-ir | FDA Prescribing Information — Adderall (mixed amphetamine salts, immediate-release tablets). Label updated 2023-10-13. | TBD (accessdata.fda.gov) | 2026-04-22 |
| fda-adderall-xr | FDA Prescribing Information — Adderall XR (mixed amphetamine salts, extended-release capsules). Label updated 2025-03-17. | TBD (accessdata.fda.gov) | 2026-04-22 |
| fda-methylphenidate | FDA Prescribing Information — Methylphenidate Hydrochloride (IR/SR/ER, non-Concerta). Label updated 2026-01-06. | TBD (accessdata.fda.gov) | 2026-04-22 |
| fda-concerta | FDA Prescribing Information — Concerta (methylphenidate OROS ER). 72 mg/day adult max. | TBD (accessdata.fda.gov) | 2026-04-22 |
| fda-vyvanse | FDA Prescribing Information — Vyvanse (lisdexamfetamine dimesylate). Label updated 2025-10-01. 70 mg/day max; renal adjustment: 50 mg/day severe renal, 30 mg/day ESRD. | TBD (accessdata.fda.gov) | 2026-04-22 |
| aafp-2024 | Olagunju AE, Ghoddusi F. Attention-Deficit/Hyperactivity Disorder in Adults. Am Fam Physician. 2024;110(2):157-166. | TBD (aafp.org) | 2026-04-22 |
| cochrane-castells2018 | Castells X, Blanco-Silvente L, Cunill R. Amphetamines for Attention Deficit Hyperactivity Disorder (ADHD) in Adults. Cochrane Database Syst Rev. 2018;8:CD007813. | https://doi.org/10.1002/14651858.CD007813.pub3 | 2026-04-22 |
| jama-psych-farhat2024 | Farhat LC, Flores JM, Avila-Quintero VJ, et al. Treatment Outcomes With Licensed and Unlicensed Stimulant Doses for Adults With ADHD: A Systematic Review and Meta-Analysis. JAMA Psychiatry. 2024;81(2):157-166. | https://doi.org/10.1001/jamapsychiatry.2023.3985 | 2026-04-22 |
| lancet-psych-farhat2025 | Farhat LC, Lannes A, Del Giovane C, et al. Comparative Cardiovascular Safety of Medications for ADHD in Children, Adolescents, and Adults: A Systematic Review and Network Meta-Analysis. Lancet Psychiatry. 2025;12(5):355-365. | https://doi.org/10.1016/S2215-0366(25)00062-8 | 2026-04-22 |
| asam-aaap-2024 | ASAM/AAAP. The ASAM/AAAP Clinical Practice Guideline on the Management of Stimulant Use Disorder. J Addict Med. 2024;18(1S Suppl 1):1-56. | https://doi.org/10.1097/ADM.0000000000001299 | 2026-04-22 |
| aacap-greenhill2002 | Greenhill LL, Pliszka S, Dulcan MK, et al. Practice Parameter for the Use of Stimulant Medications in the Treatment of Children, Adolescents, and Adults. J Am Acad Child Adolesc Psychiatry. 2002;41(2 Suppl):26S-49S. | https://doi.org/10.1097/00004583-200202001-00003 | 2026-04-22 |
| asrs-ustun2017 | Ustun B, Adler LA, Rudin C, et al. The WHO Adult ADHD Self-Report Screening Scale for DSM-5. JAMA Psychiatry. 2017;74(5):520-527. | https://doi.org/10.1001/jamapsychiatry.2017.0298 | 2026-04-22 |
| asrs-anbarasan2020 | Anbarasan D, Kitchin M, Adler LA. Screening for Adult ADHD. Curr Psychiatry Rep. 2020;22(12):72. | https://doi.org/10.1007/s11920-020-01194-9 | 2026-04-22 |
| cdc-opioid-2022 | Dowell D, Ragan KR, Jones CM, Baldwin GT, Chou R. CDC Clinical Practice Guideline for Prescribing Opioids for Pain — United States, 2022. MMWR Recomm Rep. 2022;71(3):1-95. | https://doi.org/10.15585/mmwr.rr7103a1 | 2026-04-22 |
| aap-wolraich2019 | Wolraich ML, Hagan JF, Allan C, et al. Clinical Practice Guideline for the Diagnosis, Evaluation, and Treatment of ADHD in Children and Adolescents. Pediatrics. 2019;144(4):e20192528. | https://doi.org/10.1542/peds.2019-2528 | 2026-04-22 |
| aaap-batki2023 | Batki SL, Ciccarone D, Hadland SE, et al. Management of Stimulant Use Disorder. American Academy of Addiction Psychiatry. 2023. | TBD (aaap.org) | 2026-04-22 |
| nejm-volkow2013 | Volkow ND, Swanson JM. Adult Attention Deficit–Hyperactivity Disorder. N Engl J Med. 2013;369(20):1935-1944. | https://doi.org/10.1056/NEJMcp1212625 | 2026-04-22 — **Flagged as outdated on tics contraindication (MP Flag 10); cite sparingly** |
| cochrane-candido2021 | Cândido RCF, Menezes de Padua CA, Golder S, Junqueira DR. Immediate-Release Methylphenidate for Attention Deficit Hyperactivity Disorder (ADHD) in Adults. Cochrane Database Syst Rev. 2021;1:CD013011. | https://doi.org/10.1002/14651858.CD013011.pub2 | 2026-04-22 — Added from FA-A |
| bjgp-price2024 | Price A, Becker K, Ward JH, et al. Support for Primary Care Prescribing for Adult ADHD in England: National Survey. Br J Gen Pract. 2024;74(748):e777-e783. | https://doi.org/10.3399/BJGP.2023.0595 | 2026-04-22 — Added from FA-A (NICE shared-care evidence) |
| bmc-asherson2022 | Asherson P, Leaver L, Adamou M, et al. Mainstreaming Adult ADHD Into Primary Care in the UK: Guidance, Practice, and Best Practice Recommendations. BMC Psychiatry. 2022;22(1):640. | https://doi.org/10.1186/s12888-022-04290-7 | 2026-04-22 — Added from FA-A (UK PC-integration evidence) |
| nejm-cortese2020 | Cortese S. Pharmacologic Treatment of Attention Deficit–Hyperactivity Disorder. N Engl J Med. 2020;383(11):1050-1056. | https://doi.org/10.1056/NEJMra1917069 | 2026-04-22 — Added from FA-A; cited again in FA-B for CV action thresholds |
| nice-ng87 | NICE. Attention deficit hyperactivity disorder: diagnosis and management. NICE guideline NG87 (2018; last updated 2024). | TBD (nice.org.uk/guidance/ng87) | 2026-04-22 — Direct citation URL needs manual confirmation |
| bnf-adhd | British National Formulary — ADHD stimulant dose sections (adult). Specific BNF edition/year TBD. | TBD (bnf.nice.org.uk) | 2026-04-22 — Referenced via NICE; direct BNF citation URL needs manual lookup |
| jacc-torresacosta2020 | Torres-Acosta N, O'Keefe JH, O'Keefe CL, Lavie CJ. Cardiovascular Effects of ADHD Therapies: JACC Review Topic of the Week. J Am Coll Cardiol. 2020;76(7):858-866. | https://doi.org/10.1016/j.jacc.2020.05.081 | 2026-04-22 — Added from FA-B (BP threshold framework) |
| lancet-thapar2016 | Thapar A, Cooper M. Attention Deficit Hyperactivity Disorder. Lancet. 2016;387(10024):1240-1250. | https://doi.org/10.1016/S0140-6736(15)00238-X | 2026-04-22 — Added from FA-B (baseline ECG guidance) |
| amssm-putukian2011 | Putukian M, Kreher JB, Coppel DB, et al. Attention Deficit Hyperactivity Disorder and the Athlete: AMSSM Position Statement. Clin J Sport Med. 2011;21(5):392-401. | https://doi.org/10.1097/JSM.0b013e3182262eb1 | 2026-04-22 — Added from FA-B |
| ecap-lee2026 | Lee MJ, Huang CW, Hung TH, Chen YL, Chen VC. Use of Methylphenidate and the Risk of Cardiovascular Diseases in Children and Adolescents With a Family History of Heart Diseases and Congenital Heart Diseases: A Self-Controlled Case Series Study. Eur Child Adolesc Psychiatry. 2026;35(2):631-639. | https://doi.org/10.1007/s00787-025-02882-8 | 2026-04-22 — Added from FA-B (cardiac-hx risk data) |
| jch-cluett2021 | Cluett JL, Ishak AM, Mukamal KJ, Juraschek SP. A Novel Protocol to Assess the Impact of Prescription Stimulants on Blood Pressure in Adults Using Ambulatory Blood Pressure Monitoring. J Clin Hypertens (Greenwich). 2021;23(6):1264-1268. | https://doi.org/10.1111/jch.14250 | 2026-04-22 — Added from FA-B (ABPM use) |
| eneuropsych-buitelaar2022 | Buitelaar JK, van de Loo-Neus GHH, Hennissen L, et al. Long-Term Methylphenidate Exposure and 24-Hours Blood Pressure and Left Ventricular Mass in Adolescents and Young Adults With ADHD. Eur Neuropsychopharmacol. 2022;64:63-71. | https://doi.org/10.1016/j.euroneuro.2022.09.001 | 2026-04-22 — Added from FA-B (long-term BP data) |
| jama-psych-zhang2024 | Zhang L, Li L, Andell P, et al. ADHD Medications and Long-Term Risk of Cardiovascular Diseases. JAMA Psychiatry. 2024;81(2):178-187. | https://doi.org/10.1001/jamapsychiatry.2023.4294 | 2026-04-22 — **Key FA-B ref** — Swedish nested case-control, largest long-term CVD cohort |
| jacc-holt2024 | Holt A, Strange JE, Rasmussen PV, et al. Long-Term Cardiovascular Risk Associated With Treatment of ADHD in Adults. J Am Coll Cardiol. 2024;83(19):1870-1882. | https://doi.org/10.1016/j.jacc.2024.03.375 | 2026-04-22 — Added from FA-B (Danish cohort) |
| jamaopen-zhang2022 | Zhang L, Yao H, Li L, et al. Risk of Cardiovascular Diseases Associated With Medications Used in ADHD: A Systematic Review and Meta-analysis. JAMA Netw Open. 2022;5(11):e2243597. | https://doi.org/10.1001/jamanetworkopen.2022.43597 | 2026-04-22 — Added from FA-B (prior null meta-analysis; explains 2024 divergence) |
| jamaopen-oliva2025 | Oliva HNP, Prudente TP, Mayerson TF, et al. Safety of Stimulants Across Patient Populations: A Meta-Analysis. JAMA Netw Open. 2025;8(5):e259492. | https://doi.org/10.1001/jamanetworkopen.2025.9492 | 2026-04-22 — Added from FA-B (corroborates Farhat 2025) |

---

## Asset inventory (for live module rewrite)

All non-prose content that needs to survive into the live ADHD module is cataloged here. **Policy (user-set, 2026-04-22): no images or graphs in the live module — cite + link only, route deep evidence through Meridian's existing OpenEvidence pathway.** This applies to all figures referenced in FA-A and FA-B below.

### Tables (CSV-formatted in this tracker)

| # | Location in tracker | Content | Target in live module | Reproducibility |
|---|--------------------|---------|----------------------|-----------------|
| T1 | ~line 263 (Bundle 1) | Medication × Formulation × FDA Max × Nuance × Refs — 5 rows covering Adderall IR/XR, methylphenidate IR/SR/ER + Concerta OROS, Vyvanse | `faqs.ceiling-dose.q1` answer_html — convert to HTML `<table>` with `[ref:fda-adderall-ir]` etc. markers | ✅ Full — plain ASCII; mirrors `~/Downloads/openevidence-table-2026-04-22.csv` |
| T2 | ~line 289 (Bundle 1) | Claim × Verdict × Correction × Refs summary of Bundle 1 | Internal tracker only — does NOT ship | ✅ Metadata only |
| T3 | ~line 600 (FA-A) | Guideline × MPH × Amphetamine × Lisdex × PC-vs-specialist scope — 5 rows (FDA, NICE/BNF, CADDRA, AACAP, "CPGs generally") | Either `faqs.ceiling-dose.q1` (alongside T1) or new FAQ on guideline context | ✅ Full — plain ASCII with `<strong>` markup; needs HTML `<table>` conversion |
| T4 | ~line 808 (FA-B) | Parameter × agent (MPH/Amphet/Lisdex/Viloxazine/Atomoxetine) × SBP/DBP/Pulse — adult mean changes vs placebo with 95% CI | `faqs.functional.q1` answer_html (CV monitoring section) — HTML `<table>` with `[ref:lancet-psych-farhat2025]` | ✅ Full — plain ASCII CSV |

**Schema note:** Tables are new territory for `modules/*.json` — current FAQ answer_html uses only `<p>`, `<span class="pill">`, and `<em>/<strong>`. Adding HTML `<table>` requires: (a) verifying CSS in `index-rendered.html` renders tables cleanly (grep for `table` selectors first), (b) ensuring DOCX/PDF/PPTX export paths (`parseAnswerHtml`, `htmlToPlain`, ~line 7625+) handle tables without breaking.

### Images (reference-only — DO NOT embed in live module)

Per user policy: POC decision-making doesn't need the deep evidence figures. Citation + OE pathway is sufficient. These files are kept locally as verification artifacts only.

| # | Local path | Subject | Live module treatment |
|---|-----------|---------|----------------------|
| I1 | `/home/noahs/Downloads/yoi230081f3.jpg` | Farhat 2024 JAMA Psych Fig 3 — forest plots: SMD (symptom change) + OR (AE dropouts), beyond-FDA vs within-FDA doses | Prose description of findings + `[ref:jama-psych-farhat2024]` only. No embed. |
| I2 | `/home/noahs/Downloads/yoi230086t2.jpg` | Zhang 2024 JAMA Psych Table 2 — CVD risk stratified by subtype (HTN / arterial dz / arrhythmia / etc.) × cumulative duration | Prose description (Row 44 captures the numbers) + `[ref:jama-psych-zhang2024]` only. No embed. |
| I3 | `/home/noahs/Downloads/1-s2.0-S0735109724066075-gr5.jpg` | Holt 2024 JACC central illustration — 10-yr CV risk dose-response in adult ADHD | Prose description (Row 44) + `[ref:jacc-holt2024]` only. No embed. |

**Path-case note:** In-text references in FA-A/FA-B use lowercase `~/downloads/...`; actual paths are `~/Downloads/...` (capital D). Human discovery is fine; any script path needs correction.

### Reproducibility summary

| Asset type | Count | Can all be reproduced into the live module? |
|-----------|-------|---------------------------------------------|
| CSV tables | 4 (T1, T3, T4 for module; T2 tracker metadata only) | ✅ Yes — all plain text, convert to HTML `<table>` |
| Images | 3 (I1–I3) | ✅ Yes — per user policy, cite + link only via `[ref:X]` markers; no image asset pipeline needed |
| References added across OE passes | 29 total (22 from MP/B1 + 6 new from FA-A including 2 TBD + 11 new from FA-B) | ✅ Captured in References staging table; 7 marked TBD for FDA/guideline URLs |
| Prose claim rewrites | 32 of 48 rows resolved with verdicts + source traceability | ✅ |

All content for the planned `adhd.json` v1.1.0 rewrite is accounted for in this file. The rewrite itself is the next execution step once Bundles 2–8 are run.

---

## Prompt iteration log

If Bundle 1 results come back weak or generic, refine the prompt template and record what changed. Future bundles should use the refined version.

- **v1** (initial): _see "Shared bundle prompt template" above_
- **v2** (if needed): _record changes here_

---

## Follow-up prompts (deep-dives from OE's end-of-bundle suggestions)

At the end of Bundle 1 and the meta-pass, OE offered two concrete deep-dives. Both are directly relevant to finalizing `ceiling-dose.q1` and `functional.q1`, so running them now — before touching `adhd.json` — will give a stronger evidence base for the rewrites flagged in Rows 18–21, 23, 32, and 35.

Run these as two separate OE queries (focused queries return sharper citations than combined ones).

### Follow-up A — Guideline vs FDA dose ceilings for adult ADHD stimulants

**Why we're asking:** Bundle 1 flagged that FDA-labeled maximums do not always match specialist practice (e.g., methylphenidate up to 100 mg/day is described as "within specialty practice" per the 2024 JAMA Psych dose-response meta-analysis). Before the module tells a PCP that "above FDA max requires specialist co-management," we need to know where major international guidelines actually draw the line.

```
I'm finalizing a primary care decision-support module on managing adult
patients inherited on stimulant therapy for ADHD. I need to understand
how specialty practice guidelines position their dose ceilings for adult
ADHD stimulants relative to the FDA labels, because FDA label maximums
(Adderall IR 40 mg/day, Concerta 72 mg/day, Vyvanse 70 mg/day) do not
always match guideline practice.

For each of the following major guidelines:
  - NICE (UK) — ADHD diagnosis and management (NG87)
  - CADDRA (Canada) — Canadian ADHD Practice Guidelines (current edition)
  - APA / AACAP — any formally-endorsed adult ADHD practice guideline
  - British Association for Psychopharmacology (BAP) — ADHD evidence-based guidelines
  - Any relevant WFSBP (World Federation of Societies of Biological Psychiatry) consensus

Please tell me:
  1. What daily dose ceiling (if any) the guideline specifies for adults
     for each stimulant class (methylphenidate and amphetamine), and
     whether that ceiling differs from the FDA label.
  2. The evidence basis cited by the guideline for exceeding FDA-labeled
     ceilings — RCT data, naturalistic studies, specialist consensus, or
     pharmacokinetic rationale.
  3. Whether any guideline explicitly delineates a primary-care vs.
     specialist-care scope for doses above the FDA label.
  4. The 2024 JAMA Psychiatry dose-response meta-analysis (Farhat et al.)
     reported plateaus in symptom benefit around 30–35 mg/day for
     amphetamines and diminishing return at higher doses for methylphenidate.
     How do these findings map onto the guideline ceilings you describe?

Do not assume guideline ceilings are equivalent to FDA ceilings — I want
the actual numbers and the evidence that supports them. Cite specific
guideline section/page where possible.
```
Results:
Here is a guideline-by-guideline analysis of dose ceilings relative to FDA labels, with the critical caveat that the medical literature database does not contain the full text of several of these guidelines (CADDRA, BAP, WFSBP). What follows synthesizes what is available from secondary sources, the Farhat et al. meta-analysis, and FDA labels.

---

**The core finding: CPGs generally recommend dose ceilings substantially higher than FDA labels, but the 2024 dose-response evidence challenges this practice.**

The Farhat et al. (2024) JAMA Psychiatry meta-analysis explicitly states that "there is little agreement on the maximum doses at which escalation should stop, with CPGs generally recommending levels that are **higher than those licensed** by regulatory agencies such as the US Food and Drug Administration (FDA). For instance, while the FDA recommends a maximum of 60 mg per day for most formulations of methylphenidate, **CPGs generally recommend doses up to 100 mg per day**." This framing — that guideline ceilings routinely exceed FDA labels — is the starting point for the module.[1]

---

**Guideline-by-Guideline Analysis**

**1. NICE NG87 (UK, 2018; last updated 2024)**

NICE does not specify a fixed numeric dose ceiling for adults. Instead, it recommends titrating to "the optimum dose of the medicine for each person, with maximum treatment benefits and the lowest risk of harms." The NICE approach defers to the UK's British National Formulary (BNF) for specific dose limits, which lists:[2]

- Methylphenidate IR: up to **60 mg/day** (in divided doses); Concerta XL: up to **54 mg/day** (note: the BNF adult ceiling for Concerta is lower than the FDA's 72 mg)
- Lisdexamfetamine: up to **70 mg/day**
- Dexamfetamine: up to **60 mg/day**

Critically, NICE NG87 **requires specialist initiation** of ADHD medication, with ongoing prescribing transferred to primary care under shared-care agreements.[3][4] A 2022 UK expert consensus group noted that this model creates significant access barriers, with >40% of respondents reporting AMHS wait times of ≥2 years, and recommended developing ADHD specialism within primary care.[4][3] The NICE model thus explicitly delineates a **specialist-initiates, primary-care-continues** scope — the closest any major guideline comes to formally distinguishing prescribing roles by provider type.

**2. CADDRA (Canada, 2020 edition)**

The CADDRA guidelines are referenced in the Cochrane review as recommending "a multimodal approach, including psychosocial treatment combined with medications when appropriate." The Farhat et al. meta-analysis groups CADDRA among the CPGs recommending methylphenidate doses up to[2] **100 mg/day** for adults, which substantially exceeds the FDA ceiling of 60–72 mg/day.[1] CADDRA does not appear to formally distinguish primary care vs. specialist dose thresholds in the available literature, though the Canadian model generally permits family physicians to both diagnose and treat adult ADHD.

**3. APA / AACAP**

The APA has not published a formally endorsed adult ADHD practice guideline. The AACAP Practice Parameter (2002) — the most recent formally endorsed US guideline addressing adult stimulant dosing — recommends maximum daily doses of **65 mg for methylphenidate** and **40 mg for DEX/AMP** in adults, with weight-based guidance of up to 1.0 mg/kg for MPH or 0.9 mg/kg for DEX/AMP.[5] The AACAP parameter explicitly states that when using higher doses, "the clinician should clearly document that such symptoms could not be controlled at lower doses and the higher doses are not producing side effects." This 2002 parameter does not distinguish primary care vs. specialist scope.[5] The AAP guideline does not include adult recommendations.[6]

**4. BAP (British Association for Psychopharmacology)**

The BAP ADHD guideline (most recently updated 2014, with a 2024 update anticipated) is not fully indexed in the available literature. Based on secondary references, the BAP has historically aligned with NICE/BNF dose ranges and endorsed specialist-led titration. Specific numeric ceilings from the BAP could not be confirmed from the available sources.

**5. WFSBP**

The WFSBP consensus statement on adult ADHD is not fully indexed in the available literature. It is generally cited as supporting stimulant doses above FDA labels, consistent with the broader CPG pattern described by Farhat et al.[1]

---

**Summary Table: Guideline Ceilings vs. FDA Labels**

SourceMethylphenidate (mg/day)Amphetamine salts (mg/day)Lisdexamfetamine (mg/day)Primary Care vs. Specialist Scope?References**FDA labels**IR: 60; Concerta: **72**IR: **40**; XR: 20 (recommended)**70**No distinction[1], [2], [3]**NICE NG87 / BNF**IR: 60; Concerta XL: 54Dexamfetamine: 6070**Yes** — specialist initiates, primary care continues under shared care[4], [5], [6]**CADDRA (2020)**Up to **100**Not specified in available sources70No formal distinction[4], [7]**AACAP (2002)****65** (or 1.0 mg/kg)**40** (or 0.9 mg/kg DEX/AMP)N/A (predates lisdexamfetamine)No formal distinction[8]**CPGs generally** (per Farhat et al.)Up to **100**Higher than FDA labels—Not typically specified[7]
```
csv
Source,Methylphenidate (mg/day),Amphetamine salts (mg/day),Lisdexamfetamine (mg/day),Primary Care vs. Specialist Scope?,References
<strong>FDA labels</strong>,IR: 60; Concerta: <strong>72</strong>,IR: <strong>40</strong>; XR: 20 (recommended),<strong>70</strong>,No distinction,[1-3]
<strong>NICE NG87 / BNF</strong>,IR: 60; Concerta XL: 54,Dexamfetamine: 60,70,"<strong>Yes</strong> — specialist initiates, primary care continues under shared care",[4-6]
<strong>CADDRA (2020)</strong>,Up to <strong>100</strong>,Not specified in available sources,70,No formal distinction,"[4, 7]"
<strong>AACAP (2002)</strong>,<strong>65</strong> (or 1.0 mg/kg),<strong>40</strong> (or 0.9 mg/kg DEX/AMP),N/A (predates lisdexamfetamine),No formal distinction,[8]
<strong>CPGs generally</strong> (per Farhat et al.),Up to <strong>100</strong>,Higher than FDA labels,—,Not typically specified,[7]
```
---

**How the Farhat et al. (2024) dose-response data maps onto these ceilings**

The Farhat et al. meta-analysis (47 RCTs, 7,714 participants) provides the strongest available evidence challenging the high guideline ceilings:[1]

**Methylphenidate:** The dose-response curve showed continued symptom reduction across the entire dose range studied (15–82.5 mg/day), but gains were **progressively smaller beyond 35–40 mg/day**. The ED50 was 25 mg/day and the ED95 was 72.5 mg/day. Unlicensed doses (above FDA labels) provided a statistically significant but **small** additional symptom reduction (SMD −0.23; 95% CI −0.44 to −0.02; very low certainty), accompanied by **doubled odds of adverse event dropouts** (OR 2.02; 95% CI 1.19–3.43; moderate certainty).[1]

**Amphetamines:** The dose-response curve **plateaued at 30–35 mg/day** with an ED95 of only 30 mg/day. Unlicensed doses were **not** associated with additional symptom reduction compared to licensed doses (SMD −0.08; 95% CI −0.24 to 0.08; P = .31), while adverse event risk continued to increase linearly.[1]

“While practitioners may trial unlicensed doses of stimulants in adults with ADHD who have shown partial response and good tolerability at the maximum licensed dose, they should be aware that there may not be large gains in the patients' response to the medication with those further increments in dose.”
— Luis C. Farhat, MD1,  et al.Department of Psychiatry, Faculdade de Medicina FMUSP, Universidade de São Paulo, São Paulo, Brazil and other institutions

The following figure from Farhat et al. shows the network meta-analysis comparing unlicensed vs. licensed doses for both stimulant classes, demonstrating the small benefit but increased adverse event risk for methylphenidate, and no benefit for amphetamines:

Figure 3
Network Estimates for Stimulant Doses Beyond US Food and Drug Administration (FDA) Recommendations Against Lower Doses Within FDA Recommendations
undefined
[see ~/downloads/yoi230081f3.jpg]
Treatment Outcomes With Licensed and Unlicensed Stimulant Doses for Adults With Attention-Deficit/Hyperactivity Disorder: A Systematic Review and Meta-Analysis. JAMA Psychiatry. January 31, 2024.
Content used under license from the JAMA Network®
© American Medical Association
---

**Implications for the module's "above FDA max requires specialist co-management" rule**

The evidence supports a nuanced position:

1. **For amphetamines, the module's rule is well-supported.** The dose-response plateau at 30–35 mg/day means that doses above the FDA-labeled maximum (40 mg IR) offer essentially no additional average benefit while increasing adverse events. Escalation beyond FDA labels is difficult to justify on population-level evidence and appropriately triggers specialist review.[1]
2. **For methylphenidate, the picture is more complex.** CPGs (particularly CADDRA) recommend up to 100 mg/day, and the dose-response curve does show continued (though diminishing) benefit above 60 mg/day. However, the evidence quality is very low, and the risk of adverse event dropouts doubles at unlicensed doses. The FDA-labeled ceiling of 72 mg/day for Concerta already captures the ED95 (72.5 mg/day), suggesting that the FDA label for this formulation is well-calibrated to the evidence. Doses above 72 mg/day have minimal expected benefit on average.[1]
3. **NICE is the only major guideline that formally distinguishes primary care vs. specialist prescribing scope**, requiring specialist initiation with shared-care transfer to primary care. No US guideline makes this distinction explicitly, though the AACAP parameter's documentation requirements for higher doses implicitly suggest greater caution.[3][4][5]

**Recommended module language:** Rather than "above FDA max requires specialist co-management," consider: "Doses above FDA-labeled maximums are used in specialist practice but are supported by very low certainty evidence showing minimal additional average benefit with increased adverse event risk. For amphetamines, dose-response data show a plateau at 30–35 mg/day, making escalation above FDA labels difficult to justify. For methylphenidate, small incremental gains may occur above 60 mg/day but with doubled adverse event dropout risk. Primary care providers inheriting patients on above-label doses should seek specialist documentation of rationale rather than independently escalating."[1]

Would you like to explore the specific cardiovascular safety data at higher stimulant doses, including the 2025 Lancet Psychiatry network meta-analysis findings on blood pressure and heart rate effects across the dose range?

### References

1. Treatment Outcomes With Licensed and Unlicensed Stimulant Doses for Adults With Attention-Deficit/Hyperactivity Disorder: A Systematic Review and Meta-Analysis. Farhat LC, Flores JM, Avila-Quintero VJ, et al. JAMA Psychiatry. 2024;81(2):157-166. doi:10.1001/jamapsychiatry.2023.3985.
2. Immediate-Release Methylphenidate for Attention Deficit Hyperactivity Disorder (ADHD) in Adults. Cândido RCF, Menezes de Padua CA, Golder S, Junqueira DR. The Cochrane Database of Systematic Reviews. 2021;1:CD013011. doi:10.1002/14651858.CD013011.pub2.
3. Support for Primary Care Prescribing for Adult ADHD in England: National Survey. Price A, Becker K, Ward JH, et al. The British Journal of General Practice : The Journal of the Royal College of General Practitioners. 2024;74(748):e777-e783. doi:10.3399/BJGP.2023.0595.
4. Mainstreaming Adult ADHD Into Primary Care in the UK: Guidance, Practice, and Best Practice Recommendations. Asherson P, Leaver L, Adamou M, et al. BMC Psychiatry. 2022;22(1):640. doi:10.1186/s12888-022-04290-7.
5. Practice Parameter for the Use of Stimulant Medications in the Treatment of Children, Adolescents, and Adults. Greenhill LL, Pliszka S, Dulcan MK, et al. Journal of the American Academy of Child and Adolescent Psychiatry. 2002;41(2 Suppl):26S-49S. doi:10.1097/00004583-200202001-00003.
6. Pharmacologic Treatment of Attention Deficit–Hyperactivity Disorder. Cortese S. The New England Journal of Medicine. 2020;383(11):1050-1056. doi:10.1056/NEJMra1917069.
7. Methylphenidate Hydrochloride. Food and Drug Administration. Updated date: 2025-01-20.
8. Attention-Deficit/Hyperactivity Disorder in Adults. Olagunju AE, Ghoddusi F. American Family Physician. 2024;110(2):157-166.
9. Dextroamphetamine Saccharate, Amphetamine Aspartate Monohydrate, Dextroamphetamine Sulfate and Amphetamine Sulfate. Food and Drug Administration. Updated date: 2025-03-17.

### Follow-up B — Cardiovascular monitoring protocols and long-term CVD data for adult stimulant patients

**Why we're asking:** Meta-pass Flag 11 (paired with Row 32) established that routine BP/HR monitoring is standard of care, not only symptomatic monitoring. Before writing the addition, we need concrete thresholds (at baseline and follow-up) and a view of long-term CVD risk so the module can give a PCP actionable numbers, not just "monitor routinely."

```
I'm adding cardiovascular monitoring guidance to a primary care
decision-support module on adult ADHD stimulant management. The draft
currently only flags symptomatic cardiovascular concerns (palpitations,
chest pain, significant BP elevation) — but the 2025 Lancet Psychiatry
network meta-analysis (Farhat et al.) and the 2024 AAFP review both
recommend routine cardiovascular monitoring for ALL stimulant-treated
adults, not just those with symptoms.

Please provide specifics I can cite:
  1. Baseline screening before starting or inheriting stimulants:
     - BP and HR thresholds that should prompt NOT initiating (or
       pausing an inherited prescription) — e.g., what BP cutoff
       constitutes "uncontrolled hypertension" for this purpose?
     - Whether baseline ECG is recommended in adults (vs. the
       well-established pediatric AAP guidance).
     - Whether any personal or family history findings trigger
       cardiology referral before continuing.
  2. Ongoing monitoring cadence and thresholds:
     - Recommended frequency of BP/HR checks for stable patients.
     - BP or HR changes from baseline that should trigger dose
       reduction or discontinuation.
     - Any role for ambulatory BP monitoring in equivocal cases.
  3. Long-term cardiovascular outcome data:
     - What does the Zhang 2024 JAMA Psychiatry Swedish cohort study
       (or any comparable long-term cohort) quantify for absolute and
       relative CVD risk in stimulant-treated adults?
     - How does that risk compare across stimulant classes
       (methylphenidate vs. amphetamines) and durations of exposure?
     - Are there specific patient subgroups where the long-term CVD
       signal is meaningfully elevated?
  4. What guidance does the Farhat 2025 Lancet Psychiatry network
     meta-analysis offer beyond "monitor all patients"? Any
     class- or agent-level differences in BP/HR effect size?

Cite guideline or trial section, and flag any area where the evidence
base is thin enough that the module should say so explicitly rather
than give a false sense of precision.
```
**Follow up B response**
Here is a structured evidence review organized by the four domains requested, with explicit flagging where the evidence base is too thin for the module to provide precise thresholds.

---

## 1. Baseline Screening Before Starting or Inheriting Stimulants

**BP thresholds — "uncontrolled hypertension"**

No ADHD-specific guideline defines a numeric BP cutoff for "uncontrolled hypertension." The FDA labels for amphetamine products list **"moderate to severe hypertension"** as a contraindication, while the AAFP 2024 review uses the broader term "uncontrolled hypertension." The JACC review (Torres-Acosta et al. 2020) notes that the ACC hypertension guidelines recommend decreasing the dose or discontinuing sympathomimetic amines in patients with hypertension.[1][2][3] In practice, this means the module should reference standard AHA/ACC hypertension staging rather than inventing an ADHD-specific threshold:

- **Stage 1 hypertension (130–139/80–89 mmHg):** Not a contraindication, but stimulants may worsen control. Document baseline, optimize antihypertensive therapy, and monitor closely.
- **Stage 2 hypertension (≥140/90 mmHg):** Proceed with caution; stimulants should generally not be initiated until BP is controlled. For inherited patients already on stimulants, this warrants urgent BP management and consideration of dose reduction.
- **BP ≥180/120 mmHg (hypertensive crisis):** Absolute contraindication to continuing stimulants until resolved.

The module should state explicitly: **"No ADHD guideline specifies a numeric BP cutoff for 'uncontrolled hypertension.' Apply standard AHA/ACC hypertension staging. Stimulants are FDA-contraindicated in moderate-to-severe hypertension."**[2]

**Baseline ECG**

Routine baseline ECG is **not recommended** for all adults starting stimulants. The FDA labels recommend a "careful history (including assessment for a family history of sudden death or ventricular arrhythmia) and physical exam to assess for the presence of cardiac disease," with further cardiac evaluation (including ECG and echocardiogram) only **"if findings suggest such disease."** The AAFP 2024 review states that "electrocardiography may be recommended for some patients, based on their symptoms, conditions, and personal or family cardiovascular history." The Lancet review (Thapar & Cooper 2016) states it is "reasonable but not mandatory" to perform a routine ECG, at the treating clinician's discretion.[2][1][4] The AAP explicitly rejected routine pre-stimulant ECG in children, and no adult guideline mandates it.[5][6]

The module should state: **"Baseline ECG is not routinely required. Obtain ECG if the history or exam suggests cardiac disease — not as a screening test for all patients."**

**Personal/family history triggers for cardiology referral**

The FDA label and AAP guideline provide the most specific list. Before prescribing (or continuing) stimulants, assess for:[6][2]

- Personal history of: structural cardiac abnormalities, cardiomyopathy, serious heart rhythm abnormalities, coronary artery disease, prior MI, symptomatic cardiovascular disease, Wolff-Parkinson-White syndrome
- Family history of: sudden death, ventricular arrhythmia, hypertrophic cardiomyopathy, long QT syndrome
- Symptoms: exertional chest pain, unexplained syncope, exertional dyspnea, palpitations

If any of these are present, **obtain further cardiac evaluation (ECG, echocardiogram, and/or cardiology referral) before continuing stimulants.** A 2026 Taiwanese self-controlled case series found that congenital heart disease was associated with elevated arrhythmia risk during the pre-exposure period, though methylphenidate itself did not significantly increase ischemic or cerebrovascular events even in this high-risk group.[2][6][7]

---

## 2. Ongoing Monitoring Cadence and Thresholds

**Monitoring frequency**

The FDA recommends BP and HR monitoring **"periodically (every 3 months)"** for patients on stimulants.[8] The 2020 NEJM review (Cortese) provides the most specific actionable guidance, recommending: **"Measure heart rate and blood pressure after each dose change and every 6 months"** for stable patients.[9] NICE recommends monitoring at each dose change and at least every 6 months thereafter.

For the module, a reasonable synthesis: **"Check BP and HR at baseline, after each dose change, and at minimum every 6 months for stable patients. More frequent monitoring (every 3 months) is appropriate for patients with cardiovascular risk factors or borderline readings."**

**Action thresholds**

The Cortese 2020 NEJM review provides the only published numeric thresholds for action:[9]

- **Sustained resting tachycardia >120 bpm** → reduce dose and refer to specialist
- **Systolic BP >95th percentile (or a clinically significant increase) on two occasions** → reduce dose and refer to specialist
- **Arrhythmia detected** → reduce dose and refer

For adults, the ">95th percentile" threshold translates to approximately **≥140/90 mmHg** (Stage 2 hypertension by AHA/ACC criteria). The module should note: **"These thresholds derive from the NICE/European ADHD Guidelines Group framework (Cortese 2020) and are the most specific published action thresholds, though they were developed primarily for pediatric populations and extrapolated to adults."**[9]

The FDA labels state that stimulants cause average increases of **2–4 mmHg SBP and 3–6 bpm HR**, but that "all patients should be monitored for larger changes." The AAP notes that 5–15% of individuals experience more substantial increases.[2][6]

**Ambulatory BP monitoring (ABPM)**

ABPM is not part of any standard ADHD monitoring guideline, but emerging evidence supports its use in equivocal cases. A 2021 protocol study (Cluett et al.) developed a novel 36-hour ABPM protocol comparing BP on a stimulant-free day vs. a stimulant day, demonstrating three distinct patterns: normal on both days, hypertensive on both days, or **hypertensive only on the stimulant day** — the last pattern being the most clinically actionable.[10] A 2022 cross-sectional study using 24-hour ABPM found that long-term methylphenidate users had significantly higher daytime SBP and HR than medication-naïve ADHD controls, but **nighttime values were similar**, suggesting cardiovascular recovery during sleep.[11]

The module should state: **"ABPM is not routinely recommended but may be useful when office BP readings are borderline or inconsistent, particularly to distinguish stimulant-attributable hypertension from white-coat or essential hypertension. This remains an area of limited evidence."**[10][11]

---

## 3. Long-Term Cardiovascular Outcome Data

**Zhang et al. 2024 (JAMA Psychiatry) — Swedish nested case-control study**

This is the largest and most rigorous long-term CVD outcome study to date (N = 278,027 individuals with ADHD; 10,388 CVD cases; median follow-up 14 years). Key findings:[12]

- **Dose-response relationship with cumulative duration:** Each 1-year increase in ADHD medication use was associated with a **4% increased risk of CVD** (AOR 1.04; 95% CI 1.03–1.05). The risk increased more steeply in the first 3 years (8% per year) and then **plateaued** after approximately 3 years of cumulative use.[12]
- **Absolute risk at >5 years:** AOR **1.23** (95% CI 1.12–1.36) compared with nonuse.[12]
- **CVD subtypes:** The association was driven almost entirely by **hypertension** (AOR 1.80 for >5 years) and **arterial disease** (AOR 1.65 for 3–5 years). No significant association was found for arrhythmias, heart failure, ischemic heart disease, thromboembolic disease, or cerebrovascular disease.[12]
- **Dose intensity matters:** The CVD risk was statistically significant only among individuals with a mean dose ≥1.5× the defined daily dose (e.g., methylphenidate ≥45 mg/day). At ≥2× DDD (e.g., methylphenidate >60 mg/day), each additional year of use conferred a 5% increased CVD risk.[12]

The following table from Zhang et al. shows the CVD risk stratified by specific cardiovascular outcome and cumulative duration of ADHD medication use:

Table 2
Risk of Cardiovascular Disease (CVD) Associated With Cumulative Duration of Attention-Deficit/Hyperactivity Disorder (ADHD) Medication Use, Stratified by Type of CVD Event
undefined
see for reference, not for inclusion in module: ~/Downloads/yoi230086t2.jpg


**By medication class:**[12]

- **Methylphenidate:** AOR 1.20 (95% CI 1.10–1.31) for 3–5 years; AOR 1.19 (1.08–1.31) for >5 years
- **Lisdexamfetamine:** AOR 1.23 (1.05–1.44) for 2–3 years; AOR 1.17 (0.98–1.40) for >3 years (borderline significance)
- **Atomoxetine:** Significant only for the first year of use (AOR 1.07)
- No sex differences were observed.[12]

**Holt et al. 2024 (JACC) — Danish cohort**

A complementary Danish cohort study examined 10-year absolute cardiovascular risk across ADHD treatment exposure levels. The central illustration shows a dose-response relationship, with the highest risk observed in patients taking ≥1 defined daily dose per day, particularly for stroke and heart failure:

Figure 5
Central Illustration. Associations Between 10-Year Cardiovascular Risk and ADHD Treatment in Adults
undefined
see for reference, not for inclusion in module ~/Downloads/1-s2.0-S0735109724066075-gr5.jpg

**Context from prior meta-analyses:** The Zhang et al. 2022 JAMA Network Open meta-analysis of 19 observational studies (3.9 million participants) found **no statistically significant association** between ADHD medication use and CVD in young/middle-aged adults (RR 1.04; 95% CI 0.43–2.48) or older adults (RR 1.59; 0.62–4.05), but noted that most studies had short follow-up (median 1.5 years).[14] The 2024 Zhang study's longer follow-up (14 years) likely explains the divergent findings — the CVD risk signal emerges primarily after 2+ years of cumulative use.[12]

---

## 4. Farhat 2025 Lancet Psychiatry — Agent-Level CV Differences

The Farhat et al. 2025 network meta-analysis (102 RCTs, 22,702 participants) provides the most comprehensive short-term comparative data. In adults, the mean increases vs. placebo were:[15]

ParameterMethylphenidateAmphetaminesLisdexamfetamineViloxazineAtomoxetineReferencesSBP (mmHg)+1.66 (0.38–2.93)+2.30 (0.66–3.94)+1.84 (0.72–2.96)—+1.93 (0.47–3.39)[1]DBP (mmHg)+1.60 (0.29–2.91)+2.14 (0.37–3.91)+3.07 (0.69–5.45)—+1.72 (0.14–3.30)[1]Pulse (bpm)+4.37 (3.16–5.59)+5.49 (3.72–7.26)+4.97 (3.82–6.12)+5.80 (2.30–9.30)+5.42 (3.93–6.91)[1]
```
csv
Parameter,Methylphenidate,Amphetamines,Lisdexamfetamine,Viloxazine,Atomoxetine,References
SBP (mmHg),+1.66 (0.38–2.93),+2.30 (0.66–3.94),+1.84 (0.72–2.96),—,+1.93 (0.47–3.39),[1]
DBP (mmHg),+1.60 (0.29–2.91),+2.14 (0.37–3.91),+3.07 (0.69–5.45),—,+1.72 (0.14–3.30),[1]
Pulse (bpm),+4.37 (3.16–5.59),+5.49 (3.72–7.26),+4.97 (3.82–6.12),+5.80 (2.30–9.30),+5.42 (3.93–6.91),[1]
```

Key findings for the module:[15]

- **No significant differences between stimulants and nonstimulants** (atomoxetine, viloxazine) for BP or pulse effects — this is a critical finding, as clinicians may assume switching to a nonstimulant eliminates CV risk.
- **Lisdexamfetamine had the largest DBP effect** (+3.07 mmHg), though confidence intervals were wide (very low CINeMA confidence).
- **Guanfacine was the only agent that decreased BP and HR** (SBP −10.1 mmHg, DBP −7.73 mmHg, pulse −6.83 bpm in adults), making it a potential option when CV concerns limit stimulant use.[15]
- **Outlier values:** ADHD medications were associated with higher rates of outlier BP and pulse values vs. placebo, meaning that while average effects are small, **individual patients may have clinically significant responses.**[15]
- **Critical limitation:** Only 4 RCTs provided medium-term data (24 weeks), and **no RCTs provided long-term (≥52 weeks) cardiovascular data.** The module should state this explicitly.[15]

A 2025 JAMA Network Open meta-analysis (Oliva et al.) corroborated these findings, reporting that pooled cardiovascular adverse event data showed statistically higher DBP and HR in stimulant groups vs. placebo, but "without apparent clinical relevance" at the group level, and no significant difference in SBP.[16]

---

**Recommended module language for the cardiovascular monitoring section:**

The evidence supports a tiered approach that the module can present with confidence, while flagging specific areas of thin evidence:

**Baseline (at first visit inheriting a stimulant prescription):**

- Measure BP and HR. Apply standard AHA/ACC hypertension staging — no ADHD-specific BP cutoff exists.[1][2]
- Obtain cardiac history: personal history of structural heart disease, arrhythmia, CAD, cardiomyopathy; family history of sudden death, long QT, HCM, WPW. If positive → ECG ± cardiology referral before continuing.[6][2]
- Routine ECG is not required in the absence of concerning history or exam findings.[1][4]

**Ongoing monitoring:**

- BP and HR at each dose change and **at minimum every 6 months** for stable patients.[9]
- Action thresholds: sustained resting HR >120 bpm, or SBP consistently ≥140/90 on two occasions → dose reduction and specialist referral.[9]
- ABPM may be useful for equivocal office readings but is not standard of care.[10]

**Long-term risk counseling:**

- Cumulative stimulant use >3 years is associated with ~23% increased relative risk of CVD (primarily hypertension and arterial disease), with risk plateauing after 3 years.[12]
- Risk is dose-dependent and statistically significant only at ≥1.5× the defined daily dose.[12]
- No increased risk of arrhythmias, heart failure, ischemic heart disease, or stroke has been demonstrated in the largest cohort studies.[12]
- **The module should state explicitly:** "Long-term CVD outcome data are observational and cannot establish causation. The absolute risk increase is modest, and the clinical significance for individual patients depends on baseline cardiovascular risk factors."[12][14]

Would you like to explore how these cardiovascular monitoring recommendations should be modified for specific high-risk subgroups — particularly older adults (≥65), patients with controlled hypertension on antihypertensives, or those with pre-existing cardiovascular disease?

### References

1. Attention-Deficit/Hyperactivity Disorder in Adults. Olagunju AE, Ghoddusi F. American Family Physician. 2024;110(2):157-166.
2. Dextroamphetamine Saccharate, Amphetamine Aspartate Monohydrate, Dextroamphetamine Sulfate and Amphetamine Sulfate. Food and Drug Administration. Updated date: 2025-03-17.
3. Cardiovascular Effects of ADHD Therapies: JACC Review Topic of the Week. Torres-Acosta N, O'Keefe JH, O'Keefe CL, Lavie CJ. Journal of the American College of Cardiology. 2020;76(7):858-866. doi:10.1016/j.jacc.2020.05.081.
4. Attention Deficit Hyperactivity Disorder. Thapar A, Cooper M. Lancet (London, England). 2016;387(10024):1240-50. doi:10.1016/S0140-6736(15)00238-X.
5. Attention Deficit Hyperactivity Disorder and the Athlete: An American Medical Society for Sports Medicine Position Statement. Putukian M, Kreher JB, Coppel DB, et al. Clinical Journal of Sport Medicine : Official Journal of the Canadian Academy of Sport Medicine. 2011;21(5):392-401. doi:10.1097/JSM.0b013e3182262eb1.
6. Clinical Practice Guideline for the Diagnosis, Evaluation, and Treatment of Attention-Deficit/Hyperactivity Disorder in Children and Adolescents. Wolraich ML, Hagan JF, Allan C, et al. Pediatrics. 2019;144(4):e20192528. doi:10.1542/peds.2019-2528.
7. Use of Methylphenidate and the Risk of Cardiovascular Diseases in Children and Adolescents With a Family History of Heart Diseases and Congenital Heart Diseases: A Self-Controlled Case Series Study. Lee MJ, Huang CW, Hung TH, Chen YL, Chen VC. European Child & Adolescent Psychiatry. 2026;35(2):631-639. doi:10.1007/s00787-025-02882-8.
8. Adult Attention Deficit–Hyperactivity Disorder. Volkow ND, Swanson JM. The New England Journal of Medicine. 2013;369(20):1935-44. doi:10.1056/NEJMcp1212625.
9. Pharmacologic Treatment of Attention Deficit–Hyperactivity Disorder. Cortese S. The New England Journal of Medicine. 2020;383(11):1050-1056. doi:10.1056/NEJMra1917069.
10. A Novel Protocol to Assess the Impact of Prescription Stimulants on Blood Pressure in Adults Using Ambulatory Blood Pressure Monitoring. Cluett JL, Ishak AM, Mukamal KJ, Juraschek SP. Journal of Clinical Hypertension (Greenwich, Conn.). 2021;23(6):1264-1268. doi:10.1111/jch.14250.
11. Long-Term Methylphenidate Exposure and 24-Hours Blood Pressure and Left Ventricular Mass in Adolescents and Young Adults With Attention Deficit Hyperactivity Disorder. Buitelaar JK, van de Loo-Neus GHH, Hennissen L, et al. European Neuropsychopharmacology : The Journal of the European College of Neuropsychopharmacology. 2022;64:63-71. doi:10.1016/j.euroneuro.2022.09.001.
12. Attention-Deficit/Hyperactivity Disorder Medications and Long-Term Risk of Cardiovascular Diseases. Zhang L, Li L, Andell P, et al. JAMA Psychiatry. 2024;81(2):178-187. doi:10.1001/jamapsychiatry.2023.4294.
13. Long-Term Cardiovascular Risk Associated With Treatment Of Attention-Deficit/Hyperactivity Disorder in Adults. Holt A, Strange JE, Rasmussen PV, et al. Journal of the American College of Cardiology. 2024;83(19):1870-1882. doi:10.1016/j.jacc.2024.03.375.
14. Risk of Cardiovascular Diseases Associated With Medications Used in Attention-Deficit/Hyperactivity Disorder: A Systematic Review and Meta-analysis. Zhang L, Yao H, Li L, et al. JAMA Network Open. 2022;5(11):e2243597. doi:10.1001/jamanetworkopen.2022.43597.
15. Comparative Cardiovascular Safety of Medications for Attention-Deficit Hyperactivity Disorder in Children, Adolescents, and Adults: A Systematic Review and Network Meta-Analysis. Farhat LC, Lannes A, Del Giovane C, et al. The Lancet. Psychiatry. 2025;12(5):355-365. doi:10.1016/S2215-0366(25)00062-8.
16. Safety of Stimulants Across Patient Populations: A Meta-Analysis. Oliva HNP, Prudente TP, Mayerson TF, et al. JAMA Network Open. 2025;8(5):e259492. doi:10.1001/jamanetworkopen.2025.9492.

**What to do with the results:** Both responses feed into concrete prose for the module rewrites. Paste each response into a new subsection below its prompt (mirroring how Bundle 1 findings are captured) so the tracker remains the single source of truth. Extract any new citations into the References staging table with fresh `ref_id`s (suggested: `zhang-jama-psych-2024` for the Swedish cohort, `nice-ng87` for NICE, `caddra-2024` for CADDRA, etc.).
