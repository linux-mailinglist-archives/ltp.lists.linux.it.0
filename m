Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 091E52489DD
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Aug 2020 17:29:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9571C3C2FEA
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Aug 2020 17:29:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 85B693C04C3
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 17:29:14 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 824651400FBE
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 17:29:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BC825AFF9;
 Tue, 18 Aug 2020 15:29:39 +0000 (UTC)
Date: Tue, 18 Aug 2020 17:29:41 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Po-Hsu Lin <po-hsu.lin@canonical.com>
Message-ID: <20200818152941.GG27964@yuki.lan>
References: <20200818100422.27775-1-po-hsu.lin@canonical.com>
 <20200818100422.27775-2-po-hsu.lin@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200818100422.27775-2-po-hsu.lin@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCHv2 1/2] lib/tst_kvercmp: Add support to get
 distname for different OS in tst_kvcmp_distname
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
Cc: viresh.kumar@linaro.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
>  static char *parse_digit(const char *str, int *d)
>  {
>  	unsigned long v;
> @@ -127,6 +130,8 @@ int tst_kvexcmp(const char *tst_exv, const char *cur_ver)
>  
>  const char *tst_kvcmp_distname(const char *kver)
>  {
> +	static char distname[64];
> +	char *tok;
>  	if (strstr(kver, ".el5uek"))
>  		return "OL5UEK";
>  
> @@ -139,6 +144,17 @@ const char *tst_kvcmp_distname(const char *kver)
>  	if (strstr(kver, ".el6"))
>  		return "RHEL6";
>  
> +	// Special case for other releases with the presencse of /etc/os-release
> +	if (access(OSRELEASE_PATH, F_OK) != -1) {
> +		SAFE_FILE_LINES_SCANF(NULL, OSRELEASE_PATH, "ID=%s", distname);
> +		tok = strtok(distname,"\0");

Isn't this strtok() useless?


Other than that the patchset looks fine.

> +		while (*tok) {
> +			*tok = toupper((unsigned char) *tok);
> +			tok++;
> +		}
> +		return distname;
> +	}
> +
>  	return NULL;
>  }
>  
> -- 
> 2.25.1
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
