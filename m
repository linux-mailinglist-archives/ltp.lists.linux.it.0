Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9876F87C67
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Aug 2019 16:13:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 64E623C1CDE
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Aug 2019 16:13:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id DB5CB3C12FD
 for <ltp@lists.linux.it>; Fri,  9 Aug 2019 16:13:56 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BDEB9100174A
 for <ltp@lists.linux.it>; Fri,  9 Aug 2019 16:13:49 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 001B9AFCC;
 Fri,  9 Aug 2019 14:13:54 +0000 (UTC)
Date: Fri, 9 Aug 2019 16:13:54 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yixin Zhang <yixin.zhang@intel.com>
Message-ID: <20190809141354.GF32115@rei.lan>
References: <20190809062000.8671-1-yixin.zhang@intel.com>
 <20190809062000.8671-2-yixin.zhang@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809062000.8671-2-yixin.zhang@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH ltp 2/5] runtest: rename gf*** and rwtest{1..5} in
 lvm.part{1, 2} and scsi_debug.part1
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
> There are lots tests with duplicated name gf*** and rwtest0{1..5} in the
> 3 runtest file but they are testing different fs. Rename them to
> distingulish.
> 
> 1. Change gf*** to gf***_lvm/gf***_scsi
> 2. Chagne rwtest** to rwtest{1..8}**_lvm/rwtest{1..8}**_scsi, which the
>    code 1..8 is the code for the target filesystem

I'm undecided on this one. On one hand I do not think that maintaining
unique names across different runtest files is feasible. On the other
hand this case is probably fine since it's unlikely that we will change
these files frequently.

Does anybody have strong opinion on this?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
