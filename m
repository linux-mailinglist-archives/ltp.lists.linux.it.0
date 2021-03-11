Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6AA336C66
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Mar 2021 07:44:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 85D423C32D3
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Mar 2021 07:44:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id A24743C1DA5
 for <ltp@lists.linux.it>; Thu, 11 Mar 2021 07:44:16 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 41B0E600F3A
 for <ltp@lists.linux.it>; Thu, 11 Mar 2021 07:44:15 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 718F8AB8C;
 Thu, 11 Mar 2021 06:44:15 +0000 (UTC)
Date: Thu, 11 Mar 2021 07:44:14 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <YEm8PrqshtMdcpu5@pevik>
References: <20210308160122.24522-1-pvorel@suse.cz>
 <20210308160122.24522-2-pvorel@suse.cz>
 <604974A5.6080604@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <604974A5.6080604@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] docparse: Unify Description and Algorithm
 titles
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Yang,

> On 2021/3/9 0:01, Petr Vorel wrote:
> > Instead owo'n'df fixing sources docs unify it during doc generation.
> Hi Petr,

> Your fix unifies Description and Algorithm in metadata.{html, pdf}.
> I wonder if we should do the conversion in metadata.json instead.
Yep, that could work as well. Not a strong opinion about it.

Kind regards,
Petr

> Best Regards,
> Xiao Yang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
