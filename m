Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3760236C812
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Apr 2021 16:55:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 009B23C65A9
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Apr 2021 16:55:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2A4C83C1DA6
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 16:55:12 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3FFBB601C4E
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 16:55:11 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5C38BB1C5
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 14:55:11 +0000 (UTC)
Date: Tue, 27 Apr 2021 16:35:37 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YIghOWTqlx3W0ol/@yuki>
References: <20210426111918.4304-1-mdoucha@suse.cz>
 <20210426111918.4304-4-mdoucha@suse.cz> <YIgUcqIhXVgiqaMu@yuki>
 <ceb5f5b5-2efd-beaf-e617-7fa0b28c0ff2@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ceb5f5b5-2efd-beaf-e617-7fa0b28c0ff2@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/4] RFC: Add rtnetlink helper library
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
> > You are calling safe_realloc() here yet you check the return value. And
> > it's the same for safe_malloc(), safe_bind(), safe_socket() and a few
> > more in the code.
> > 
> > So either we get rid of the error checks and of the error
> > propagation or we avoid using safe_ variants.
> 
> Both rtnetlink and netdevice management functions will be called in
> cleanup() so I have to assume that the safe functions will only print a
> warning instead of terminating the program. But I still want to use the
> error reporting code in the safe functions.

Right, I've realized that too, we have to return to the caller in that
case to carry on with the cleanup.

> > Other than that the code looks sane but it's hard to review the API
> > without an example that would excersize it. What about adding something
> > simple in newlib_tests?
> 
> There are short examples for both rtnetlink and netdevice management in
> the cover letter. The netdevice library itself is also a detailed
> example for the rtnetlink API. The final patchset will include the
> SADDNS CVE test which will use most of the netdevice management
> functions in setup().

Ah I've missed that. We should add it somewhere to the doc/ directory
since the cover letter would end up burried in the mailing list history.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
