#!/bin/bash
# cleanup-sorting.sh — One-time file sort for Daniel Vega's Mac.
# Run in Terminal on your Mac: bash ~/Downloads/cleanup-sorting.sh
#
# Nothing is permanently deleted. Unclear files go to ~/Desktop/To-Delete/
# for manual review. Safe to re-run.

set -euo pipefail

ICLOUD="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
DL="$HOME/Downloads"
DESK="$HOME/Desktop"
DOCS="$HOME/Documents"
REVIEW="$DESK/To-Delete"

move() {
    local src="$1" dst="$2"
    if [ -e "$src" ]; then
        mkdir -p "$dst"
        mv "$src" "$dst/"
        echo "  ✓ $(basename "$src")"
    fi
}

echo "=== Cleanup Sorting — Daniel Vega ==="
echo "Unclear files will land in ~/Desktop/To-Delete/ for your review."
echo ""
mkdir -p "$REVIEW"

# ── Create folders ────────────────────────────────────────────────────────────
mkdir -p "$ICLOUD/BbV/Brand Assets"
mkdir -p "$ICLOUD/BbV/Research"
mkdir -p "$ICLOUD/BbV/V"
mkdir -p "$ICLOUD/Job Search/Master Resume & Cover Letter"
mkdir -p "$ICLOUD/Job Search/Active Applications"
mkdir -p "$ICLOUD/Deez/Data"
mkdir -p "$ICLOUD/Deez/EYJ"
mkdir -p "$ICLOUD/DV/Medical"
mkdir -p "$ICLOUD/DV/Mateo"
mkdir -p "$ICLOUD/Archive/Welcome-US"
mkdir -p "$ICLOUD/Personal/Financial"
mkdir -p "$ICLOUD/Personal/Photos"
mkdir -p "$ICLOUD/Sons-Games"
echo "✓ Folder structure created"
echo ""

# ─────────────────────────────────────────────────────────────────────────────
echo "── BUILT BY VEGA ────────────────────────────────────────────────────────"
# Brand assets
for f in \
    "bbv-banner-FINAL-v6.png" "bbv-banner-with-photo-v3.png" \
    "bbv-linkedin-banner-v2.png" "bbv-linkedin-banner-v3.png" \
    "built_by_vega_logo_v2.svg" "builtbyvega_design_brief.docx" \
    "builtbyvega_linkedin_banner_1584x396.png" \
    "builtbyvega-linkedin-banner-1584x396-2.png" \
    "builtbyvega-linkedin-banner-1584x396.png" \
    "builtbyvega-linkedin-banner-FINAL.png" \
    "vega-logo-final.svg" "vega-logo-v14_1.svg" "vega-logo-v14_2.svg" "vega-logo-v14.svg" \
    "headshot-banner-blend.png" "headshot-cream-bg.png" "profile-pic.png" \
    "2_Brand Identity"; do
    move "$DL/$f" "$ICLOUD/BbV/Brand Assets"
done

# Streetwear brand concepts (Shogun, Blossom, Merciless, Shinobi, Nippon, Murakami)
for f in "$DL"/Firefly_*.jpg "$DL"/Firefly_*.png; do
    [ -e "$f" ] && move "$f" "$ICLOUD/BbV/Brand Assets"
done
for f in \
    "shogun_hoodie.jpg" "shogun_jersey_sleeveless.jpg" "shogun_snapback.jpg" "shogun_tee.jpg" \
    "blossom_kimono_womens_belt.jpg" "blossom_sukajan_black.jpg" "blossom_sukajan_bomber_bonus.jpg" \
    "merciless_tee_kanji.jpg" "nippon_tee_transit.png" "shinobi_snapback.jpg" \
    "murakami" "murakami_firefly_prompts.md" \
    "Gemini_Generated_Image_94aenq94aenq94ae.png" "Gemini_Generated_Image_rvz7ccrvz7ccrvz7.png"; do
    move "$DL/$f" "$ICLOUD/BbV/Brand Assets"
done

# Pitch decks and brand concepts
for f in "$DL"/southside_drops_pitch_deck*.html "$DL"/southside-drops-experience*.html \
          "$DL"/whats-your-idea*.html; do
    [ -e "$f" ] && move "$f" "$ICLOUD/BbV/Brand Assets"
done
for f in "Built by Vega.html"; do
    move "$DL/$f" "$ICLOUD/BbV/Brand Assets"
done

# Research and planning docs
for f in "$DL"/daniel_ai_*.html; do
    [ -e "$f" ] && move "$f" "$ICLOUD/BbV/Research"
done
for f in \
    "bbv-master-ecosystem.html" "bbv-master-ecosystem_1.html" "bbv-master-ecosystem_2.html" \
    "superpowers-reference.html" "index.html" \
    "Bookshop Dreams_Brainstorming_2025_v15.docx" \
    "FinancialLiteracyApp_BusinessPlan.docx" \
    "LBI Brand Board (Quick View)_2025.pdf" "LBI_Website Redesign_202501_v1.docx" \
    "customer-journey-map-slides" "Customer-Journey-Templates" \
    "Funnel Slides" "Org Chart Slides" "process-slides" \
    "Project Management Slides" "responsibility-assignment-matrix-rev" "timeline-slides"; do
    move "$DL/$f" "$ICLOUD/BbV/Research"
done
echo ""

# ─────────────────────────────────────────────────────────────────────────────
echo "── JOB SEARCH ───────────────────────────────────────────────────────────"
# Master / most recent resumes
for f in \
    "Daniel_Vega_Resume_2026_Reframed.docx" \
    "DV Resume Nov 2024.docx" "DV Resume Nov 2024.pdf" \
    "DV Resume 2.0 2024.docx" \
    "Daniel R. Vega_Bio_Resume_June 2025.pdf" \
    "Daniel R. Vega_Resume_June 2025.pdf" \
    "resume files 5.7.26.zip" \
    "development-report_daniel-vega_2025-01-14_1751.pdf" \
    "Profile.pdf"; do
    move "$DL/$f" "$ICLOUD/Job Search/Master Resume & Cover Letter"
done

# Tailored resumes, cover letters, and application support
for f in \
    "16OnCenter_Resume_Daniel_Vega.docx" \
    "Daniel Vega CL_Mercury_3.29.25.docx" \
    "Daniel Vega Resume_Mercury_3.29.25.docx" \
    "Daniel_Vega_Resume_Mercury_3.29.25_UPDATED.docx" \
    "Daniel_Vega_Cubs_CoverLetter.docx" "Daniel_Vega_Cubs_MarqueeMktgMgr.docx" \
    "Daniel_Vega_Grubhub_Resume.docx" \
    "Daniel_Vega_Guild_CoverLetter.docx" "Daniel_Vega_Guild_SeniorMktgMgr.docx" \
    "Daniel_Vega_Indeed_Events_Cover_Letter_Final.docx" \
    "Daniel_Vega_Indeed_Events_Resume_Final_Corrected_Scale.docx" \
    "Daniel_Vega_Instacart_CoverLetter.docx" "Daniel_Vega_Instacart_StrategicPartnerMgr.docx" \
    "Daniel_Vega_Invision_CoverLetter.docx" "Daniel_Vega_Invision_DirectorCampaigns.docx" \
    "Daniel_Vega_JointCommission_Cover_Letter.docx" "Daniel_Vega_JointCommission_Resume.docx" \
    "Daniel_Vega_Lovesac_CoverLetter.docx" "Daniel_Vega_Lovesac_DirectorIntegratedMktg.docx" \
    "Daniel_Vega_Netflix_LaunchMgr.docx" \
    "Daniel_Vega_OldNational_Resume.docx" \
    "Daniel_Vega_Pinterest_CoverLetter.docx" "Daniel_Vega_Pinterest_IntegratedMktgMgr.docx" \
    "Daniel_Vega_Pointme_CoverLetter.docx" "Daniel_Vega_Pointme_IntegratedMktgMgr.docx" \
    "Daniel_Vega_PointsOfLight_CoverLetter.docx" "Daniel_Vega_PointsOfLight_SVP.docx" \
    "Daniel_Vega_Salesforce_CoverLetter.docx" "Daniel_Vega_Salesforce_ExecPartnerships.docx" \
    "Daniel_Vega_TAG_Motto_CoverLetter.docx" \
    "Daniel_Vega_TAG_MottoMktgMgr_1.docx" "Daniel_Vega_TAG_MottoMktgMgr.docx" \
    "Daniel_Vega_Target_Companies_Reference.docx" \
    "DrivenBrands_Resume_Daniel_Vega.docx" \
    "DV CL.docx" "DV CL.pdf" "DV Lambda CL.docx" "DV Obama CL.docx" \
    "DV Resume 2024 (1).pdf" "DV Resume 2024.pdf" \
    "DV Resume July 2024 (1).pdf" "DV Resume July 2024 v1.pdf" \
    "DV Resume July 2024.pdf" "DV Resume July 2024.pptx" "DV Resume July 2024.rtf" \
    "DV Resume 2.0 2024.docx" \
    "Dan Vega April 2024 Resume v1.pdf" "Dan Vega April 2024 Resume.pdf" \
    "Daniel R. Vega_Bio_Resume_May 2025.png" \
    "Daniel Vega Resume 2020 .pdf" "Daniel Vega Resume 2020 (1).pdf.pdf" \
    "Hyatt_Cover_Letter_Daniel_Vega.docx" \
    "Wellhub_Cover_Letter_Daniel_Vega.docx" "Wellhub_Resume_Daniel_Vega.docx" \
    "CoverLetter-Medical.pdf" \
    "Marketing_Job_Listings_May2025.xlsx" "Vetted_Job_Listings_27_May2025.xlsx" \
    "Motto_Interview_Prep.pptx" "Salesforce_Interview_Prep_1.pptx" "Salesforce_Interview_Prep.pptx" \
    "Manager, Strategy & Implementation.pdf" \
    "Senior Director of Communications - Feb 2023.pdf" \
    "Basic_LinkedInDataExport_01-20-2026.zip.zip" "linkedin-marketing-labs" \
    "DVsheet.docx" "ResumeF.pdf" "DANIEL VEGA.pdf"; do
    move "$DL/$f" "$ICLOUD/Job Search/Active Applications"
done
echo ""

# ─────────────────────────────────────────────────────────────────────────────
echo "── FANTASY BASEBALL (DEEZ) ──────────────────────────────────────────────"
# Core docs
for f in \
    "2023 Deez Nutz Fantasy Baseball Spreadsheet.xlsx" \
    "2024 Deez Nutz Fantasy Baseball Spreadsheet.xlsx" \
    "2025 Auction FA's.xlsx" "2025 Fangraphs ATC Rankings.xlsx" \
    "Automated SGP Rankings Tool 2.20.26.xlsx" "AutomatedSGPRankingTool" \
    "Copy of Fangraphs Fantasy Baseball Dashboard.xlsx" \
    "Deez full roster 2.13.26.csv" "Deez_Keepers_3_9_26_UPDATED.xlsx" \
    "deez_rules.txt" "SGP-Calculator.xlsx" \
    "fangraphs-auction-calculator.xlsx" "fa_mlbcs_2023v16.pdf" \
    "effyoujobu 1.11.24.xls"; do
    move "$DL/$f" "$ICLOUD/Deez"
done
for f in "$DL"/deez_20*.txt; do [ -e "$f" ] && move "$f" "$ICLOUD/Deez"; done
for f in \
    "$DL"/Cheat-Sheet-Generator-*.xlsx "$DL"/Custom-Sheet-Generator-*.xlsx \
    "$DL"/Draft-Cheat-Sheet-*.xlsx "$DL"/Draft-Sheet-Auction-Values-*.xlsx \
    "$DL"/fangraphs-auction-calculator*.xls "$DL"/projections*.xls; do
    [ -e "$f" ] && move "$f" "$ICLOUD/Deez"
done

# EYJ-specific
for f in \
    "EYJ_2026_Draft_Board_v2.xlsx" "EYJ_Draft_Saturday_22.html" "EYJ_Draft_Saturday.html" \
    "EYJ_Roster_SGP_Dashboard_FINAL.xlsx" "eyj-manager-2026"; do
    move "$DL/$f" "$ICLOUD/Deez/EYJ"
done

# Data CSVs
for f in \
    "$DL"/FG*.csv "$DL"/Steamer*.csv "$DL"/Stuff+.csv \
    "$DL"/sprint_speed.csv "$DL"/expected_stats.csv "$DL"/exit_velocity.csv \
    "$DL"/statcast*.csv "$DL"/FantasyPros_*.csv "$DL"/fangraphs-auction-calculator*.csv \
    "$DL"/roster-overview-all-*.csv "$DL"/roster-sch-*.csv \
    "$DL"/stats-*.csv "$DL/stats.csv" \
    "$DL"/overall-*.csv "$DL/overall.csv" \
    "$DL"/projections-*.csv "$DL/projections.csv" \
    "$DL"/nomination-*.csv "$DL/nomination.csv" \
    "$DL/lineup.csv" "$DL/live standing.csv" "$DL/cheatsheet.csv" \
    "$DL"/all-*.csv "$DL/all.csv" \
    "$DL/2021.csv" "$DL/2022.csv" \
    "$DL/2023.csv" "$DL/2023-2.csv" "$DL/2023-3.csv" \
    "$DL/2024.csv" "$DL/2024-2.csv" "$DL/2024-3.csv" \
    "$DL/2025.csv" "$DL/2025-2.csv" "$DL/2025-3.csv" \
    "$DL/ADP.tsv" "$DL/SFBB Player ID Map - PLAYERIDMAP.csv" \
    "$DL/roster-overview-all-8-20250505.xlsx"; do
    [ -e "$f" ] && move "$f" "$ICLOUD/Deez/Data"
done
for f in "sprint-dashboard-v2.html"; do move "$DL/$f" "$ICLOUD/Deez/Data"; done
echo ""

# ─────────────────────────────────────────────────────────────────────────────
echo "── WELLNESS & MEDICAL ───────────────────────────────────────────────────"
for f in \
    "Daniel Vega Superbill.pdf" "Daniel Vega Tx.PDF" \
    "DV Couples Therapy Release of Info.pdf" "DV NeuroPsych Referral.pdf" \
    "Health_Record_1497187_2024081933874.pdf" \
    "HealthSummary_Feb_27_2025 (1)" "HealthSummary_Feb_27_2025 (1).zip" \
    "HealthSummary_Feb_27_2025.zip" \
    "Scan - CT RESULT SCAN - Oct 26, 2021.PDF" \
    "Scan - PATHOLOGY_CYTOLOGY SCAN - Oct 26, 2021.PDF" \
    "Skyrizi Receipt.pdf" "SummaryBillFeb2025.pdf" \
    "RPA _ Ginger Overview.pdf" "AtaGlanceSummary.pdf" \
    "Jacob Therapy_May through September.pdf" \
    "November Statement Jake Therapy.pdf" \
    "September - October _Jacob Therapy Invoices.pdf"; do
    move "$DL/$f" "$ICLOUD/DV/Medical"
done
for f in "$DL"/JM\ Therapy\ *.pdf; do [ -e "$f" ] && move "$f" "$ICLOUD/DV/Medical"; done
echo ""

# ─────────────────────────────────────────────────────────────────────────────
echo "── MATEO ────────────────────────────────────────────────────────────────"
for f in \
    "0_Reports and Assessments-20251112T160427Z-1-001.zip" \
    "1_Individualized Education Plans (All)-20251112T160432Z-1-001.zip" \
    "Blank_CBM Client Face Sheet (7).pdf" \
    "Individualized Education Program (IEP) for Mateo Vega (236093738).pdf" \
    "Individualized Education Program (IEP) for Mateo Vega (60230751) (1).pdf" \
    "Individualized Education Program (IEP) for Mateo Vega (60230751).pdf" \
    "Letter for Providers_ADOS REFERRAL (7).pdf" \
    "MATEO IEP June 2023 .pdf" \
    "Mateo Vega Agenda Tri.docx.pdf" \
    "Mateo Vega CBM Autism Diagnosis Intake Packet 11.12.25.pdf" \
    "Mateo Vega Finalized IEP.pdf" "Mateo Vega IEP.pdf" \
    "Mateo Vega Psychological Report.pdf" "MateoVegaencryptedchart (13).pdf" \
    "MVega 2022-23 IEP (1).pdf" "MVega 2022-23 IEP.pdf" \
    "MVegaIEP (1).pdf" "MVegaIEP.pdf" "MV headshot.jpg"; do
    move "$DL/$f" "$ICLOUD/DV/Mateo"
done
echo ""

# ─────────────────────────────────────────────────────────────────────────────
echo "── SON'S GAMES ──────────────────────────────────────────────────────────"
for f in "Crossover_World_Chronicles_Comic_With_Images.pdf" "Crossover_World_Toonator_Frame_Sheet.pdf"; do
    move "$DL/$f" "$ICLOUD/Sons-Games"
done
echo ""

# ─────────────────────────────────────────────────────────────────────────────
echo "── WELCOME.US ARCHIVE ───────────────────────────────────────────────────"
for f in \
    "Building a Nation of Welcomers_December 2022.pdf" \
    "CEO Council Leadership Overview.pdf" "CEO Council Participation Chart.png" "CEO Council Scorecard.xlsx" \
    "company scorecard .pptx" \
    "4_28_ Day-of Meeting Slides PRIMARY DRAFT.pdf" \
    "4_4_ Pre-read slides_DavidMaria.pdf" \
    "4.28 Pre-read Data Slides v1 3.22.pdf" "4.28 Pre-read Data Slides v1 3.22.pptx" \
    "4.28 Proposed Agenda w_Discussion Questions (1).pdf" \
    "4.28 Proposed Agenda w_Discussion Questions.pdf" \
    "April 28 CEO Council Meeting Run of Show.docx" \
    "April 28 CEO Council Meeting Run of Show.docx (1).pdf" \
    "April 28 CEO Council Meeting Run of Show.docx.pdf" \
    "Daniel Robert Vega - Welcome.US - Offer Letter.doc.pdf" \
    "Engage to Change + Amazon High Level.docx" \
    "Imbriaco_Welcome.US CV 3.23.34.pdf" \
    "Julie & Sundar TY Email_4.28.23.docx" \
    "NEW for 4_13_ Updated CEO Council_Sponsorship Webinar.pptx" \
    "Newcomer Hiring Fair- for Accenture  (1).docx" "Newcomer Hiring Fair- for Accenture .docx" \
    "Revised_ 4_28 Agenda & ROS.pdf" \
    "Sediqa Fahimi _W.US.pdf" \
    "Sponsorship Slide for Annelisa.pdf" "Talent Table Dashboard as of 5.15.pptx" \
    "TMobile_WRD_Deck_2.27.23_v5.pptx" "TMobile_WRD_Deck_2.27.23.pptx" \
    "Uniting for Ukraine_Jobs Sponsorship Program_Overview (1).pdf" \
    "Welcome Corps Quarterly Narrative Report Final (Q2Y1).pdf" \
    "Welcome Exchange Extension Pricing.docx.pdf" "Welcome Fund 14Dec2022 deck.pdf" \
    "Welcome.US 4_4 Meeting slides.pptx" "Welcome.US Activations vs Shipments Reporting.xlsx" \
    "Welcome.US Annual Report.pdf" "Welcome.US CEO April 1 Presentation Send.pptx" \
    "Welcome.US CEO Council Fall Update - Presentation Deck.pptx" \
    "Welcome.US Overview Deck _August 2023.pdf" \
    "Welcome.US Q&A for Stand Together 7March2023.pdf" \
    "Welcome.US VP Corporate Programs JD.docx.pdf" "Welcome.USMigrationCommunicationsR3.pdf" \
    "ZeeDarwish_Welcome.pdf" \
    "2023 April 28 _ J&S List for TY Note Outreach.xlsx"; do
    move "$DL/$f" "$ICLOUD/Archive/Welcome-US"
done
echo ""

# ─────────────────────────────────────────────────────────────────────────────
echo "── PERSONAL / FINANCIAL ─────────────────────────────────────────────────"
for f in \
    "Additional Registration and Purchase Documents (1).pdf" \
    "Additional Registration and Purchase Documents.pdf" \
    "Base EPO Plan (1).pdf" "Base EPO Plan.pdf" \
    "Benefits Package Information - 2022 - 2023 Plan Year - SP (2).pdf" \
    "Dependant Day Care End of July.pdf" \
    "Dependent Day Care Reimbursement Claim - May, 2023.pdf" \
    "EligibilityResultsNotice (1).pdf" "EligibilityResultsNotice (2).pdf" \
    "EligibilityResultsNotice (3).pdf" "EligibilityResultsNotice (4).pdf" \
    "EligibilityResultsNotice (5).pdf" "EligibilityResultsNotice (6).pdf" \
    "EligibilityResultsNotice.pdf" \
    "ID Cards _ UnitedHealthcare.pdf" "IdCard_UnitedHealthcare.pdf" \
    "ILPOSOverviewLetter.pdf" "invoices_20231003024505.xls" \
    "My Team Time Off Balance Detail.xlsx" \
    "Nylsa Met Life.pdf" \
    "Pathfinder Ins Dec Page .pdf" "Pathfinder Insurance Dec Page.pdf" \
    "PlanCoverageInformation.pdf" \
    "Purchase Contracts-2.pdf" "Purchase Contracts.pdf" \
    "Statement_Apr_06_2023 (1).pdf" "Statement_Apr_06_2023.pdf" \
    "Statement_Apr_30_2023.pdf" "Statement_Jun_06_2023 (1).pdf" \
    "Statement_Jun_06_2023.pdf" "Statement_May_04_2023 (1).pdf" \
    "Statement_May_04_2023.pdf" "Statement_May_31_2023.pdf" \
    "W-4P 2023.pdf" "Target FSA Receipt 5.18.24.pdf" \
    "Home Inventory List (Daniel Vega).docx" \
    "Lucas Contract Draft Nov 2022.docx" \
    "Jake Spire Statement 1.pdf" "Jake's Moving Company Agreement.pdf" \
    "DS82_Complete.pdf" "CVSC37820815.pdf" \
    "23-0531_Moyers Statement.pdf"; do
    move "$DL/$f" "$ICLOUD/Personal/Financial"
done
echo ""

# ─────────────────────────────────────────────────────────────────────────────
echo "── PERSONAL / PHOTOS ────────────────────────────────────────────────────"
for f in \
    "Jess Bridal Shower.jpg" "Wine Down with Lauren.png" "TT_Zoom_Backgrounds_SanJuan.jpg" \
    "thevegafamily-photo-download-1of1" \
    "2024bookwormball-photo-download-1of1 (1)" \
    "Hailey_Williams_Aragon_2026-04-22__PRINT-AT-18x24in-300dpi-MATTE.png" \
    "image_16829185.JPG" "image_50461697.JPG" "image_67155969.JPG" "image_67159553.JPG" \
    "image_67171073.JPG" "image_67205377.JPG" "Image.jpeg" \
    "IMG_2419.jpeg" "IMG_2899.jpeg" "IMG_3374.heic" "IMG_3375.heic" "IMG643.jpg" \
    "Picture1.png"; do
    move "$DL/$f" "$ICLOUD/Personal/Photos"
done
echo ""

# ─────────────────────────────────────────────────────────────────────────────
echo "── TO-DELETE (installers, calendar files, zips, unclear) ────────────────"
# Installed apps — safe to delete
for f in \
    "Claude.dmg" "googlechrome.dmg" "Install_ChatGPT_Atlas.dmg" \
    "Notion-7.12.0-universal.dmg" "Obsidian-1.12.7.dmg" \
    "RobloxStudio.dmg" "Teams_osx.pkg" "gh_2.89.0_macOS_amd64"; do
    move "$DL/$f" "$REVIEW"
done

# Calendar invites (already accepted, in your calendar)
for f in "$DL"/*.ics; do [ -e "$f" ] && move "$f" "$REVIEW"; done

# Zip files where the extracted folder already exists
for f in \
    "AutomatedSGPRankingTool.zip" "eyj-manager-2026.zip" \
    "customer-journey-map-slides.zip" "Customer-Journey-Templates.zip" \
    "Funnel-Slides.zip" "Org-Chart-Slides.zip" "process-slides.zip" \
    "Project-Management-Slides.zip" "responsibility-assignment-matrix-rev.zip" \
    "timeline-slides.zip" \
    "thevegafamily-photo-download-1of1.zip" \
    "2024bookwormball-photo-download-1of1 (1).zip" \
    "2024bookwormball-photo-download-1of1.zip" \
    "HealthSummary_Feb_27_2025 (1).zip" "HealthSummary_Feb_27_2025.zip" \
    "files.zip" "files" \
    "ac05556e-c217-49db-a668-b7e4d4a36740.zip" \
    "ac05556e-c217-49db-a668-b7e4d4a36740"; do
    move "$DL/$f" "$REVIEW"
done

# Unclear / unnamed files
for f in \
    "d3c25ae0f5bc11eda0d0295945ed64e2.presentation.pptx" \
    "document (1).pdf" "document.pdf" "Documents.pdf" \
    "Untitled document.pdf" "Untitled spreadsheet.xlsx" \
    "Test Document_lv.xls" "Test Document_lv.xlsx" \
    "meals.html" "M Veega.pdf" \
    "doc00146420230202090928.pdf" "doc00179020230209145619.pdf" \
    "0419_251203102426_001.pdf"; do
    move "$DL/$f" "$REVIEW"
done
echo ""

# ─────────────────────────────────────────────────────────────────────────────
echo "── DESKTOP ──────────────────────────────────────────────────────────────"
for f in \
    "a_clean_professional_headshot_portrait_in_a_circu.png" \
    "builtbyvega_linkedin_banner_no_v_profile_zone_1584x396.png" \
    "builtbyvega_linkedin_banner_v_relocated_profile_clear_1584x396.png" \
    "builtbyvega_linkedin_profile_aligned_800_final.png" \
    "builtbyvega_linkedin_profile_grid_aligned_800.png" \
    "DV LinkedIn Profile pic 5.9.26.png"; do
    move "$DESK/$f" "$ICLOUD/BbV/Brand Assets"
done
move "$DESK/DV resume" "$ICLOUD/Job Search/Active Applications"
for f in "$DESK"/Screenshot\ *.png; do [ -e "$f" ] && move "$f" "$REVIEW"; done
move "$DESK/TCS Screenshots" "$REVIEW"
echo ""

# ─────────────────────────────────────────────────────────────────────────────
echo "── DOCUMENTS ────────────────────────────────────────────────────────────"
for f in "$DOCS"/Dependent\ Care\ Receipt\ *.docx "$DOCS"/Dependent\ Care\ Receipt\ *.pdf; do
    [ -e "$f" ] && move "$f" "$ICLOUD/Personal/Financial"
done
for f in "$DOCS"/Mateo\ June\ 2023\ Physical\ *.pdf; do
    [ -e "$f" ] && move "$f" "$ICLOUD/DV/Mateo"
done
move "$DOCS/MOU_Welcome.US- FINAL (1).pdf" "$ICLOUD/Archive/Welcome-US"
move "$DOCS/Claude" "$ICLOUD/BbV/Research"
move "$DOCS/Roblox" "$ICLOUD/Sons-Games"
move "$DOCS/Zoom" "$REVIEW"
echo ""

# ─────────────────────────────────────────────────────────────────────────────
echo "=== All done! ==="
echo ""
echo "New iCloud structure:"
echo "  BbV/            — Built by Vega brand assets, research, V docs"
echo "  Job Search/     — Resumes, cover letters, applications"
echo "  Deez/           — Fantasy baseball (with EYJ/ and Data/ subfolders)"
echo "  DV/             — Wellness training, Medical records, Mateo's docs"
echo "  Archive/        — Welcome.US historical work docs"
echo "  Personal/       — Financial docs, photos, family"
echo "  Sons-Games/     — Crossover World and future game builds"
echo ""
echo "Review folder: ~/Desktop/To-Delete/"
echo "  - App installers (already installed)"
echo "  - Old calendar files"
echo "  - Duplicate zip files"
echo "  - Unnamed/unclear files"
echo ""
echo "Lock files (~\$...) were left alone — they auto-delete when Word/Excel closes."
