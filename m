Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E58217A60D
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 14:08:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5A8E63C6522
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 14:08:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 22E653C6515
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 14:08:53 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A7E7820166E
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 14:08:52 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C621DAC9D;
 Thu,  5 Mar 2020 13:08:50 +0000 (UTC)
Date: Thu, 5 Mar 2020 14:08:48 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20200305130848.GA24788@dell5510>
References: <20191210080419.128773-1-lkml@jv-coder.de>
 <20191210080419.128773-4-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210080419.128773-4-lkml@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 3/3] lsmod01: Add kernel module
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

patchset merged, with tiny style changes.
Sorry for the delay with reviewing it.

...
> +module_inserted=0
We prefer in the shell library empty over 0.

> +
> +setup()
> +{
> +	if [ -z "$(cat /proc/modules)"  ]; then
> +		tst_res TINFO "Loading dummy kernel module"
> +		tst_require_module "ltp_lsmod01.ko"
> +		tst_require_root
> +		tst_require_cmds insmod
> +		insmod "$TST_MODPATH"
> +		if [ $? -ne 0 ]; then
> +			tst_res TBROK "insmod failed"
> +			return
> +		fi
> +
> +		module_inserted=1
> +	fi
> +}
> +
> +cleanup()
> +{
> +	if [ $module_inserted -ne 0 ]; then
> +		tst_res TINFO "Unloading dummy kernel module"
> +		rmmod ltp_lsmod01
> +		if [ $? -ne 0 ]; then
> +			tst_res TWARN "rmmod failed"
> +		fi
> +		module_inserted=0
This is not needed, thus omitted.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
