Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C56F6350F16
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Apr 2021 08:35:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 36D8A3C77C5
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Apr 2021 08:35:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2C73E3C03B0
 for <ltp@lists.linux.it>; Thu,  1 Apr 2021 08:35:29 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 720841000EC3
 for <ltp@lists.linux.it>; Thu,  1 Apr 2021 08:35:28 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BE370AE91;
 Thu,  1 Apr 2021 06:35:27 +0000 (UTC)
Date: Thu, 1 Apr 2021 08:35:26 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Sharan Turlapati <sturlapati@vmware.com>
Message-ID: <YGVprik5olSjhY+n@pevik>
References: <20210329181759.4466-1-sturlapati@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210329181759.4466-1-sturlapati@vmware.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] realtime/scripts: Fix indentation error in
 parser.py
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

Hi Sharan,

> An indentation error in parser.py causes certain blocks
> of code to run even before dependent variables are
> initialized when the code in this file is imported
> by parse-testpi1.py or parse-testpi2.py.

> Post running tests like testpi-2 or testpi-4, the
> results of these tests are parsed and added to the
> logs/ directory. This bug prevents the results of such
> tests from being parsed and thus masks the results of
> these tests.

Thanks for your fix, merged!

It looks to me that 5a8408bc3 changed also whitespace in other files (it was
done by 2to3 script), but these are IMHO correct.

BTW looking into realtime sources, the code is terrible. Not sure how relevant
it is now.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
