Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F182C57BD
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 16:03:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2C2553C5DFA
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 16:03:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A88B73C2DD8
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 16:02:58 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 274D11400FA7
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 16:02:58 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 88930AD41;
 Thu, 26 Nov 2020 15:02:57 +0000 (UTC)
Date: Thu, 26 Nov 2020 16:03:49 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: j.nixdorf@avm.de
Message-ID: <20201126150349.GB4646@yuki.lan>
References: <edf96c93-8f16-6545-629a-be727d4c8eb2@oracle.com>
 <OFCE604BCE.4F62924B-ONC125862B.004801C0-C125862B.0048027B@avm.de>
 <OF47EE0279.8BED1D35-ONC125862C.0051B56D-C125862C.0051B570@avm.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OF47EE0279.8BED1D35-ONC125862C.0051B56D-C125862C.0051B570@avm.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] netstress: explicitly set a thread stack size
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> I'm reluctant to use a static value here as max_msg_len may be modified
> by command line arguments.

Wouldn't it be easier to use malloc() instead of putting large data
structures on the stack and working around that by increasing the
limits?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
