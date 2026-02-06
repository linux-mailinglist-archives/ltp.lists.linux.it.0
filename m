Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4L58EabdhWn4HQQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Feb 2026 13:25:10 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D80BDFD976
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Feb 2026 13:25:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1770380709; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=17CLqqzg8rqlm2zHxRg6fFtkmt7/1h8vsHXfedseij4=;
 b=UdeF00GKeD7zli0vudG/i85dbVIxHVqjhsdDvQRwK6N6HXHj1NU1TCbeGCjPaOEK/UMI+
 Ta1OLomooxAtOOurFxqaNP8HZNwh03aUduzSuDY1dDDD5Dg8gy863YCyBiX8BJEVFRelzZZ
 hN8T+xwyvEkY9bQikHF2d43IZqKd7Qk=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3F3C53CC7DB
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Feb 2026 13:25:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 76A793C1C05
 for <ltp@lists.linux.it>; Fri,  6 Feb 2026 13:24:57 +0100 (CET)
Received: from sea.source.kernel.org (sea.source.kernel.org
 [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 72A4314010D9
 for <ltp@lists.linux.it>; Fri,  6 Feb 2026 13:24:55 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 79CA0444C0;
 Fri,  6 Feb 2026 12:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9139EC19422;
 Fri,  6 Feb 2026 12:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770380692;
 bh=O7a8wY2zkizo/ijNU2invfJSeItdPymgjFUDFVkv854=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IZIJZ1tlaooJmKV4EzSy9QGMYd/KPYLJN/nujUHugQhzq6u1LkV/0McKFni3++GtG
 dogEinMnXpF6hMO+MLs+jb+nNylr8WiCd67HNDFlm2doQNhGy9CnM9jeuIfCkpG7sO
 fG4MPeAy5wQzlUying7T2UTfgatPx56VUFGatWi8DViuk8R+Y15wCl2RPgjDx2Neyl
 YIuxesqevK55Mq5XfLkh7N21ZPV8be6iQxQqwHYPlrQTsknGd2T1MJ3nVKTwU5z/CC
 3EzQvMtto3bjPPetbUp83zcDx8AF8URrVgIQRIJR9IbtN3SPRzNun9XuTGN0wamypJ
 UOApmRe/nSJCA==
Date: Fri, 6 Feb 2026 13:24:48 +0100
To: kernel test robot <oliver.sang@intel.com>
Message-ID: <20260206-fluktuation-verwachsen-3354f2185f31@brauner>
References: <20260127225209.2293342-1-luca.boccassi@gmail.com>
 <202602061056.b94e9170-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202602061056.b94e9170-lkp@intel.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] pidfs: return -EREMOTE when PIDFD_GET_INFO is
 called on another ns
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
From: Christian Brauner via ltp <ltp@lists.linux.it>
Reply-To: Christian Brauner <brauner@kernel.org>
Cc: lkp@intel.com, luca.boccassi@gmail.com, linux-fsdevel@vger.kernel.org,
 ltp@lists.linux.it, oe-lkp@lists.linux.dev, christian@brauner.io
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,vger.kernel.org,lists.linux.it,lists.linux.dev,brauner.io];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.linux.it:+,kernel.org:-];
	HAS_REPLYTO(0.00)[brauner@kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,linux.it:url,lists.linux.it:dkim]
X-Rspamd-Queue-Id: D80BDFD976
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 10:51:24AM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "ltp.ioctl_pidfd06.fail" on:
> 
> commit: 16cc0cf19e0b75a336cbf619d208e22b351bd430 ("[PATCH] pidfs: return -EREMOTE when PIDFD_GET_INFO is called on another ns")
> url: https://github.com/intel-lab-lkp/linux/commits/luca-boccassi-gmail-com/pidfs-return-EREMOTE-when-PIDFD_GET_INFO-is-called-on-another-ns/20260128-065425
> base: https://git.kernel.org/cgit/linux/kernel/git/vfs/vfs.git vfs.all
> patch link: https://lore.kernel.org/all/20260127225209.2293342-1-luca.boccassi@gmail.com/
> patch subject: [PATCH] pidfs: return -EREMOTE when PIDFD_GET_INFO is called on another ns
> 
> in testcase: ltp
> version: 
> with following parameters:
> 
> 	disk: 1SSD
> 	fs: btrfs
> 	test: syscalls-00/ioctl_pidfd06
> 
> 
> 
> config: x86_64-rhel-9.4-ltp
> compiler: gcc-14
> test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz (Ivy Bridge) with 8G memory
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202602061056.b94e9170-lkp@intel.com
> 
> 
> 2026-02-03 16:33:15 kirk -U ltp -f temp_single_test --env TMPDIR=/fs/sdb1/tmpdir
> Host information
> 
> 	Hostname:   lkp-ivb-d04
> 	Python:     3.13.5 (main, Jun 25 2025, 18:55:22) [GCC 14.2.0]
> 	Directory:  /tmp/kirk.root/tmppqdrj0by
> 
> Connecting to SUT: default
> 
> Starting suite: temp_single_test
> ---------------------------------
> [1;37mioctl_pidfd06: [0m[1;31mfail[0m | [1;33mtainted[0m  (0.034s)
>                                                                                                                                 
> Execution time: 0.100s
> 
> 	Suite:       temp_single_test
> 	Total runs:  1
> 	Runtime:     0.034s
> 	Passed:      0
> 	Failed:      1
> 	Skipped:     0
> 	Broken:      0
> 	Warnings:    0
> 	Kernel:      Linux 6.19.0-rc5-00159-g16cc0cf19e0b #1 SMP PREEMPT_DYNAMIC Tue Feb  3 23:56:34 CST 2026
> 	Machine:     unknown
> 	Arch:        x86_64
> 	RAM:         6899592 kB
> 	Swap:        0 kB
> 	Distro:      debian 13
> 
> Disconnecting from SUT: default
> Session stopped

Thanks! This is an intentional change in behavior and only affects
systemd which is happy to adapt to that change.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
