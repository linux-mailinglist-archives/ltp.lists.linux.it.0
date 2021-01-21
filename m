Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7FD2FF03D
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 17:28:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5997C3C871F
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 17:28:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 8A2D83C304A
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 17:28:47 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 55E721000DED
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 17:28:47 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A95C9AB7A;
 Thu, 21 Jan 2021 16:28:46 +0000 (UTC)
Date: Thu, 21 Jan 2021 17:27:46 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YAmrgpP8lUJyd/ZR@pevik>
References: <20201125053459.3314021-1-lkml@jv-coder.de>
 <20201221221838.GC4453@pevik>
 <d575ea47-142c-2ff3-1a55-58fc8f55801b@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d575ea47-142c-2ff3-1a55-58fc8f55801b@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/3] network/stress/multicast/packet-flood:
 Update to new API
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

> > Minor comments, please update them if v4 needed.
> > Otherwise it can be fixed during merge.
> > Thanks for your work.
> I don't think I'll submit a v4, if you want to fix this during merge, it is
> ok to me.
Merged with 2 fixes (using route_cleanup in route-redirect.sh and typo
$n_NORMAL) and few minor style formatting.

Thanks a lot for your work!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
