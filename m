Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 032772A945E
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Nov 2020 11:30:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2C1B33C3214
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Nov 2020 11:30:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 568833C239E
 for <ltp@lists.linux.it>; Fri,  6 Nov 2020 11:30:23 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DCCB01400DA3
 for <ltp@lists.linux.it>; Fri,  6 Nov 2020 11:30:22 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6F8BAABB2;
 Fri,  6 Nov 2020 10:30:21 +0000 (UTC)
Date: Fri, 6 Nov 2020 11:31:08 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20201106103108.GB25324@yuki.lan>
References: <20201103161052.13260-1-chrubis@suse.cz>
 <20201103161052.13260-3-chrubis@suse.cz>
 <CAEemH2dUmmFx8cEhqMP6CLpRwszeBD=kMM4i3xpBKYSV+S2d8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dUmmFx8cEhqMP6CLpRwszeBD=kMM4i3xpBKYSV+S2d8Q@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 2/2] lib/tst_kconfig: Make use of boolean
 expression eval
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
Cc: automated-testing@yoctoproject.org, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> I tried with more complicated configurations for test parsing, most works
> as expected but except the below one with parentheses ():
> 
>     "CONFIG_DEFAULT_HOSTNAME=\"(none)\"",
> 
> That's because the parentheses are the element of expression and used
> to distinguish tokens, I???m not sure whether we can change it as a general
> character to fix this problem, if no, we might need to comment on this in
> the documentation.

Well we would have to teach the tokenizer about strings, i.e. treat
everything inside of double quotes as single token. That shouldn't be
that hard, I can try to add this later on.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
