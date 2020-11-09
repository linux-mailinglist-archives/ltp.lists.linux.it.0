Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3589B2ABF6E
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 16:09:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ECBD33C537F
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 16:09:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 642FE3C2397
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 16:08:59 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E96D31000ADC
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 16:08:58 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4CBD8ABD1;
 Mon,  9 Nov 2020 15:08:58 +0000 (UTC)
Date: Mon, 9 Nov 2020 16:09:43 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Alexander Egorenkov <egorenar@linux.ibm.com>
Message-ID: <20201109150943.GB25892@yuki.lan>
References: <20201109145657.602251-1-egorenar@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201109145657.602251-1-egorenar@linux.ibm.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] lib/tst_virt: support IBM/Z LPAR and z/VM
 virtualization environments
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Actually we can simplify the code like this:

+static int is_ibmz(int virt_type)
+{
+	FILE *sysinfo;
+	char line[64];
+	int found_lpar, found_zvm;
+
+	if (virt_type != VIRT_IBMZ_LPAR && virt_type != VIRT_IBMZ_ZVM)
+		return 0;
+
+	if (access("/proc/sysinfo", F_OK) != 0)
+		return 0;
+
+	sysinfo = SAFE_FOPEN(NULL, "/proc/sysinfo", "r");
+	found_lpar = 0;
+	found_zvm = 0;
+	while (fgets(line, sizeof(line), sysinfo) != NULL) {
+		if (strstr(line, "LPAR"))
+			found_lpar = 1;
+		else if (strstr(line, "z/VM"))
+			found_zvm = 1;
+	}
+
+	SAFE_FCLOSE(NULL, sysinfo);
+
+	switch (virt_type) {
+	case VIRT_IBMZ:
+		return found_lpar;
+	case VIRT_IBMZ_LPAR:
+		return found_lpar && !found_zvm;
+	case VIRT_IBMZ_ZVM:
+		return found_lpar && found_zvm;
+	default:
+		return 0;
+	}
+}
+
 static int try_systemd_detect_virt(void)
 {
 	FILE *f;
@@ -102,6 +138,9 @@ static int try_systemd_detect_virt(void)
 	if (!strncmp("xen", virt_type, 3))
 		return VIRT_XEN;
 
+	if (!strncmp("zvm", virt_type, 3))
+		return VIRT_IBMZ_ZVM;
+
 	return VIRT_OTHER;
 }
 
@@ -118,11 +157,15 @@ int tst_is_virt(int virt_type)
 
 	switch (virt_type) {
 	case VIRT_ANY:
-		return is_xen() || is_kvm();
+		return is_xen() || is_kvm() || is_ibmz(VIRT_IBMZ);
 	case VIRT_XEN:
 		return is_xen();
 	case VIRT_KVM:
 		return is_kvm();
+	case VIRT_IBMZ:
+	case VIRT_IBMZ_LPAR:
+	case VIRT_IBMZ_ZVM:
+		return is_ibmz(virt_type);
 	case VIRT_OTHER:
 		return 0;
 	}


Do you agree with these changes?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
