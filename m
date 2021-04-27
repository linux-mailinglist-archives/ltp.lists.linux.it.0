Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FF836CB94
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Apr 2021 21:20:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2FF023C65B4
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Apr 2021 21:20:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 676B43C096D
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 21:20:41 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1603360082A
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 21:20:40 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4988EAC7D;
 Tue, 27 Apr 2021 19:20:40 +0000 (UTC)
Date: Tue, 27 Apr 2021 21:20:38 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Wang Xin <wangxin410@huawei.com>
Message-ID: <YIhkBsRClMPkyM4Y@pevik>
References: <1619491883-69694-1-git-send-email-wangxin410@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1619491883-69694-1-git-send-email-wangxin410@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] openposix/conformance/interfaces: Correct typos
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

Hi Xin,

> Types in the name of the temporary files: For example, in aio_cancel/8-1.c file,
> pts_aio_cancel_1_1 -> pts_aio_cancel_8_1.
> Others like this have been modified.

This patch is also not applicable with git am. Not sure what you do wrong,
but simple 'git format-patch origin/master' should work.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
