Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB3526BF93
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 10:43:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A55983C2B16
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 10:43:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 489783C27EE
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 10:43:30 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B15F610000C6
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 10:43:29 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7EBCFAC8B;
 Wed, 16 Sep 2020 08:43:44 +0000 (UTC)
Date: Wed, 16 Sep 2020 10:43:56 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: "Bird, Tim" <Tim.Bird@sony.com>
Message-ID: <20200916084356.GA4464@yuki.lan>
References: <CY4PR13MB117565A7BA2A8371A3B94ED9FD200@CY4PR13MB1175.namprd13.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY4PR13MB117565A7BA2A8371A3B94ED9FD200@CY4PR13MB1175.namprd13.prod.outlook.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] TPASS in new test lib
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Well, Fuego's parser only checks for PASS (probably due to the inconsistency),
> but personally I'd prefer if it was consistent. The string "TPASS" is much less
> likely to appear in unrelated output than "PASS" is.

The official runltp script checks for exit values from the test
processes, anything else, such as parsing test output, may not work
properly and will not work for at least subset of the tests that does
not use the test library.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
