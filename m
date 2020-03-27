Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2542A1958B4
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Mar 2020 15:13:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D127B3C3309
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Mar 2020 15:13:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 221E93C32DC
 for <ltp@lists.linux.it>; Fri, 27 Mar 2020 15:13:24 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8A4521001BDB
 for <ltp@lists.linux.it>; Fri, 27 Mar 2020 15:13:23 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B5DE8AC53;
 Fri, 27 Mar 2020 14:13:22 +0000 (UTC)
Date: Fri, 27 Mar 2020 15:13:26 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Cixi Geng <gengcixi@gmail.com>
Message-ID: <20200327141325.GA5525@yuki.lan>
References: <20200324121742.7130-1-gengcixi@gmail.com>
 <20200325102852.GD5404@yuki.lan> <20200325152821.GA21800@dell5510>
 <CAF12kFv0P4yTVVf-pfXOai8+3urEiWug_dbnTfAXpyfOvzi2ug@mail.gmail.com>
 <20200326070555.GA17560@dell5510>
 <CAF12kFuqJQmiZW+otpb9Hp37kqVis9UzkOKJTMKQWCPnH1nPoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF12kFuqJQmiZW+otpb9Hp37kqVis9UzkOKJTMKQWCPnH1nPoQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] uart: add uart testcase in kernel
 device-drivers
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, ltp@lists.linux.it,
 Orson Zhai <orsonzhai@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> >Cyril already mentioned the need to use proper locks instead of sleep
> I have realized the sleep is not a good way , but I don't have any idea
> about the "proper locks"
> Can you give me some help?

I've just send a patchset that implements the serial test based on the
serialcheck C source code, please have a look at that patchset.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
