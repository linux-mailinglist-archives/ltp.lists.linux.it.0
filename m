Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4A436E526
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 08:53:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1FE973C617B
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 08:53:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 66FC03C1C13
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 08:53:51 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 02CB0600F49
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 08:53:50 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4E29AB038;
 Thu, 29 Apr 2021 06:53:50 +0000 (UTC)
Date: Thu, 29 Apr 2021 08:53:48 +0200
From: Petr Vorel <pvorel@suse.cz>
To: xieziyao <xieziyao@huawei.com>
Message-ID: <YIpX/JfE4iEwKJl6@pevik>
References: <20210428092006.80460-1-xieziyao@huawei.com>
 <YIlWZc3j8esnndJP@yuki>
 <cf03bcebc3cc47708ca7aca0c4ff7294@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cf03bcebc3cc47708ca7aca0c4ff7294@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.0 required=7.0 tests=PDS_TONAME_EQ_TOLOCAL_SHORT,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] syscalls/close: Delete close08 and convert
 close01 to the new API
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Thank you, Cyril. I'll pay attention to that next time.
FYI:
https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#4-test-contribution-checklist

or even
https://github.com/linux-test-project/ltp/wiki/Maintainer-Patch-Review-Checklist

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
