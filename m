Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAF3362702
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 19:38:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2CC033C6F9D
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 19:38:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D47C43C1A97
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 19:38:54 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 753F0201023
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 19:38:54 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C05CAADCA;
 Fri, 16 Apr 2021 17:38:53 +0000 (UTC)
Date: Fri, 16 Apr 2021 19:38:52 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YHnLrGS1lXy5Awvk@pevik>
References: <20210415090542.960158-1-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210415090542.960158-1-lkml@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] pec: Fix multiple event test
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

...
> +# Find a free file handle
> +free_fd()
> +{
> +	local fd
> +
> +	for fd in $(seq 200); do
> +		# Sapwn a new sh, because redirecting to a non existing file handle
> +		# will trigger a syntax error.
> +		/bin/sh -c ": 2>/dev/null >&$fd || : 2>/dev/null <&$fd" 2>/dev/null
Probably better to use sh -c "..."

> +		if [ $? -eq 2 ]; then
> +			echo $fd
> +			return
> +		fi
> +	done

maybe I do something wrong, but this version fails for me
(and I'm still testing it only on bash):

cn_pec 1 TINFO: timeout per run is 0h 5m 0s
cn_pec 1 TINFO: Test process events connector
cn_pec 1 TINFO: Testing fork event (nevents=10)
cn_pec 1 TBROK: No free filehandle found

I guess there is something wrong free_fd().

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
