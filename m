Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFE41FB211
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 15:28:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 318123C2D04
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 15:28:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id F2BC53C5FC2
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 15:27:37 +0200 (CEST)
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4B7387DD545
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 15:26:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=5RIE+8EpdHjIjWRy7eCN7J3sN/8pSSmTZHYw0/cpfDU=; b=Vgcn+56GvP50cYcunuXQVdBiO7
 fnfxnwyIMROvsDSfTDI4ErZJQ9+vskcr3z3Yk+2eGwbt3Okc5V23CPLcgp15hFAfeL0JljOJcY/UH
 WgWXzpbw+B/Vra96qzLvN6dBNy8C0ag7AcWU8ydnebZu8XKAd05XSrt9FXDqXTuGWC8SJAI3kJvIr
 QP6NYtKBXO8odqOD8p2gwZsyHqqxhd+LlltYsLMJbVD/sK8/RkOOZX+V3RECoPFYvGHvj4yZK35t0
 PAR6XWmUF+WAS4jSk/hQoxCj49XfrJRZujXhSfM8ymHRi115Tr7vNRuQPhIFW1al43R1TvGQH0BIx
 UxcZzATA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlBcK-0002s1-JP; Tue, 16 Jun 2020 13:27:08 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id EBE3130018A;
 Tue, 16 Jun 2020 15:27:05 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id D8AA1203D48A4; Tue, 16 Jun 2020 15:27:05 +0200 (CEST)
Date: Tue, 16 Jun 2020 15:27:05 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Andy Lutomirski <luto@amacapital.net>
Message-ID: <20200616132705.GW2531@hirez.programming.kicks-ass.net>
References: <87y2onbdtb.fsf@nanos.tec.linutronix.de>
 <8E41B15F-D567-4C52-94E9-367015480345@amacapital.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8E41B15F-D567-4C52-94E9-367015480345@amacapital.net>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [x86/entry] 2bbc68f837: ltp.ptrace08.fail
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
Cc: Alexandre Chartre <alexandre.chartre@oracle.com>,
 kernel test robot <rong.a.chen@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 lkp@lists.01.org, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVHVlLCBKdW4gMTYsIDIwMjAgYXQgMDY6MjI6MTBBTSAtMDcwMCwgQW5keSBMdXRvbWlyc2tp
IHdyb3RlOgo+IAo+ID4gT24gSnVuIDE2LCAyMDIwLCBhdCAxOjQ0IEFNLCBUaG9tYXMgR2xlaXhu
ZXIgPHRnbHhAbGludXRyb25peC5kZT4gd3JvdGU6Cj4gPiAKPiA+IO+7v2tlcm5lbCB0ZXN0IHJv
Ym90IDxyb25nLmEuY2hlbkBpbnRlbC5jb20+IHdyaXRlczoKPiA+PiBGWUksIHdlIG5vdGljZWQg
dGhlIGZvbGxvd2luZyBjb21taXQgKGJ1aWx0IHdpdGggZ2NjLTkpOgo+ID4+IAo+ID4+IGNvbW1p
dDogMmJiYzY4ZjgzNzNjMDYzMWViZjEzN2YzNzZmYmVhMDBlODA4NmJlNyAoIng4Ni9lbnRyeTog
Q29udmVydCBEZWJ1ZyBleGNlcHRpb24gdG8gSURURU5UUllfREIiKQo+ID4+IGh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvY2dpdC9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdCBtYXN0
ZXIKPiA+IAo+ID4gSXMgdGhlIGhlYWQgb2YgbGludXguZ2l0IGV4cG9zaW5nIHRoZSBzYW1lIHBy
b2JsZW0gb3IgaXMgdGhpcyBhbgo+ID4gaW50ZXJtaXR0ZW50IGZhaWx1cmUsIHdoaWNoIG9ubHkg
YWZmZWN0cyBiaXNlY3RhYmlsaXR5Pwo+IAo+IEl0IHN1cmUgbG9va3MgZGV0ZXJtaW5pc3RpYzoK
PiAKPiBwdHJhY2UwOC5jOjYyOiBCUk9LOiBDYW5ub3QgZmluZCBhZGRyZXNzIG9mIGtlcm5lbCBz
eW1ib2wgImRvX2RlYnVnIgoKUk9GTAoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xp
c3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
