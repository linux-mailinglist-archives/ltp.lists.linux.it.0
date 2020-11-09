Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCBD2ABEF3
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 15:42:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D962E3C538C
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 15:42:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 676A93C2F71
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 15:42:04 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 204491400E10
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 15:42:03 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 73F6EABCC;
 Mon,  9 Nov 2020 14:42:03 +0000 (UTC)
Date: Mon, 9 Nov 2020 15:42:49 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Alexander Egorenkov <egorenar@linux.ibm.com>
Message-ID: <20201109144249.GA25892@yuki.lan>
References: <20201106130624.454614-1-egorenar@linux.ibm.com>
 <20201106130624.454614-3-egorenar@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106130624.454614-3-egorenar@linux.ibm.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] lib/tst_virt: support IBM/Z LPAR and z/VM
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
Cc: Alexander Egorenkov <Alexander.Egorenkov@ibm.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> +static int is_ibmz_lpar(void)
> +{
> +	FILE *cpuinfo;
> +	char line[64];
> +	int found_lpar, found_zvm;
> +
> +	if (access("/proc/sysinfo", F_OK) != 0)
> +		return 0;
> +
> +	cpuinfo = SAFE_FOPEN(NULL, "/proc/sysinfo", "r");
> +	found_lpar = 0;
> +	found_zvm = 0;
> +	while (fgets(line, sizeof(line), cpuinfo) != NULL) {
> +		if (strstr(line, "LPAR"))
> +			found_lpar = 1;
> +		else if (strstr(line, "z/VM"))
> +			found_zvm = 1;
> +	}
> +
> +	SAFE_FCLOSE(NULL, cpuinfo);
> +	return found_lpar && !found_zvm;
> +}
> +
> +static int is_ibmz_zvm(void)
> +{
> +	FILE *cpuinfo;
> +	char line[64];
> +	int found_lpar, found_zvm;
> +
> +	if (access("/proc/sysinfo", F_OK) != 0)
> +		return 0;
> +
> +	cpuinfo = SAFE_FOPEN(NULL, "/proc/sysinfo", "r");
> +	found_lpar = 0;
> +	found_zvm = 0;
> +	while (fgets(line, sizeof(line), cpuinfo) != NULL) {
> +		if (strstr(line, "LPAR"))
> +			found_lpar = 1;
> +		else if (strstr(line, "z/VM"))
> +			found_zvm = 1;
> +	}
> +
> +	SAFE_FCLOSE(NULL, cpuinfo);
> +	return found_lpar && found_zvm;
> +}

These two function are nearly identical apart from the last line, I
guess that it would be cleaner to have one function and pass the
VIRT_IBMZ_LPAR and VIRT_IBMZ_ZVM constants to select which result we
want.

Other than this, the rest looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
