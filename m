Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1135978910
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 12:02:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D716D3C1D26
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 12:02:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id CCBD83C176C
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 12:02:19 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4E1DD200DF3
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 12:02:17 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 94796ACB8
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 10:02:17 +0000 (UTC)
References: <20190724080328.16145-1-rpalethorpe@suse.com>
 <20190725142315.GC23135@rei.lan>
User-agent: mu4e 1.2.0; emacs 26.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <20190725142315.GC23135@rei.lan>
Date: Mon, 29 Jul 2019 12:02:17 +0200
Message-ID: <87d0htcg5y.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/2] [RFC] BPF testing
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it, Richard Palethorpe <richard.palethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Cyril Hrubis <chrubis@suse.cz> writes:

> Hi!
>> This patch set introduces a very basic test which kicks the tires of the bpf
>> system call. It doesn't actually load a eBPF program, I will create another
>> test for that. However I have some concerns which I will discuss while doing
>> that.
>>
>> There are already extensive BPF tests in the kernel selftests. These appear to
>> be quite complex and test a variety of functionality. They also are far less
>> structured than LTP's modern tests and are tied to the kernel tree which makes
>> using them in QA a pain. There are also some tests in the BCC project, which
>> may test the kernel as a byproduct.
>>
>> So there are a number of options which are not necessarily mutually exclusive:
>>
>> 1) Port (some of) the selftests to the LTP.
>> 2) Port the LTP library to the selftests.
>> 3) Focus the LTP's BPF tests on reproducing specific high impact bugs.
>
> The option 3 sounds good, just FYI there are CVEs some with POCs for BPF,
> just by googling "ebpf CVE" you got some:
>
> https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-16995
> https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-7308
>
> Also cloudfare blog seems to be very relevant:
>
> https://blog.cloudflare.com/ebpf-cant-count/
>
> And there are some test stuffed in linux/samples/bpf/ as well.

Ah, something I didn't realise is that various types of eBPF program can
be run without CAP_SYS_ADMIN because the man page is out of date. I will
send a patch for that.

--
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
