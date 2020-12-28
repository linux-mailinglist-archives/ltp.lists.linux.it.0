Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4F22E6A88
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Dec 2020 21:04:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8C2E03C55F0
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Dec 2020 21:04:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 0FC7D3C32E7
 for <ltp@lists.linux.it>; Mon, 28 Dec 2020 21:04:00 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D58AC100042B
 for <ltp@lists.linux.it>; Mon, 28 Dec 2020 21:03:59 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0FB1FAB8B;
 Mon, 28 Dec 2020 20:03:59 +0000 (UTC)
Date: Mon, 28 Dec 2020 21:03:57 +0100
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20201228200357.GA18526@pevik>
References: <20201217134620.10128-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217134620.10128-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] tst_net.sh: Require veth for netns
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> new error message is more informative:
> tcp_fastopen_run 1 TCONF: veth driver not available

> then the old one:
> Error: Unknown device type.
> tcp_fastopen_run 1 TBROK: ip li add name ltp_ns_veth1 type veth peer name ltp_ns_veth2 failed

Merged.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
