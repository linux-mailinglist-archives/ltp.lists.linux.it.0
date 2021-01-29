Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D50308992
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 15:37:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C38C43C7803
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 15:37:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 02EE53C5BAB
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 15:37:21 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B2618600657
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 15:37:21 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DB90BABDA;
 Fri, 29 Jan 2021 14:37:20 +0000 (UTC)
Date: Fri, 29 Jan 2021 15:37:19 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>, Jan Stancek <jstancek@redhat.com>
Message-ID: <YBQdn3S9sPJT/wea@pevik>
References: <20210128171052.6025-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210128171052.6025-1-kory.maincent@bootlin.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] quota_remount_test01: update to new API
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
Cc: thomas.petazzoni@bootlin.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li, Jan,

> +	# some distros (CentOS 6.x, for example) doesn't permit creating
> +	# of quota files in a directory with SELinux file_t type
Could you please check if this is still relevant?
If yes, would be enough to detect this case with tst_selinux_enabled
(from tst_security.sh)? I.e. considering only SELinux in enforce mode
(detecting with /sys/fs/selinux/enforce or /selinux/enforce).

> +	if [ -x /usr/sbin/selinuxenabled ] && /usr/sbin/selinuxenabled; then
> +		chcon -t tmp_t $MNTDIR || tst_brk TFAIL "Could not change SELinux file type"
> +		tst_res TINFO "Successfully changed SELinux file type"
> +	fi

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
