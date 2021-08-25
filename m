Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A14013F7064
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 09:29:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 72FC53C300F
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 09:29:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B038F3C2F63
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 09:29:54 +0200 (CEST)
Received: from ATCSQR.andestech.com (atcsqr.andestech.com [60.248.187.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A18E5600D1A
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 09:29:51 +0200 (CEST)
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 17P7TYcn077416;
 Wed, 25 Aug 2021 15:29:34 +0800 (GMT-8)
 (envelope-from ycliang@andestech.com)
Received: from ubuntu02 (10.0.12.212) by ATCPCS16.andestech.com (10.0.1.222)
 with Microsoft SMTP Server id 14.3.498.0; Wed, 25 Aug 2021 15:29:33 +0800
Date: Wed, 25 Aug 2021 15:29:25 +0800
From: Leo Liang <ycliang@andestech.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YSXxVXk1sdea7wnX@ubuntu02>
References: <20210825071420.5751-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210825071420.5751-1-pvorel@suse.cz>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Originating-IP: [10.0.12.212]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 17P7TYcn077416
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] doc: TST_MNTPOINT should be full path
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

On Wed, Aug 25, 2021 at 09:14:20AM +0200, Petr Vorel wrote:
> Document changed behavior in 205a43dfb ("Make argument to tst_umount an
> absolute path").
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  doc/shell-test-api.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
