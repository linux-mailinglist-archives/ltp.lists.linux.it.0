Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9160B24FC0
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 15:08:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6422C3EA71C
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 15:08:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 5485E3EA67C
 for <ltp@lists.linux.it>; Tue, 21 May 2019 15:08:29 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A19C7600A7D
 for <ltp@lists.linux.it>; Tue, 21 May 2019 15:08:30 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 70EAFAEC2;
 Tue, 21 May 2019 13:08:27 +0000 (UTC)
Date: Tue, 21 May 2019 15:08:26 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20190521130826.GA18812@rei.lan>
References: <20190506105457.22350-1-camann@suse.com>
 <1ef7d8ee-ae31-b44c-71e6-7d09da55eda2@suse.com>
 <20190506201948.GA9828@dell5510> <20190520143135.GA27341@dell5510>
 <20190520144645.GD28976@rei.lan> <20190520152400.GA11845@dell5510>
 <CAOQ4uxivgpoMeUUxm-fboFfiXLXn+QXNzKJWSHAZhidwUsuvng@mail.gmail.com>
 <20190521114040.GB13910@rei>
 <CAOQ4uxi8v+WqwY8sNh+j4b6vYfeyLvHR4+jodt1=s9hUF1FSWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxi8v+WqwY8sNh+j4b6vYfeyLvHR4+jodt1=s9hUF1FSWQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v4] syscalls/copy_file_range: add/restructured
	tests
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkhCj4gPiBTbyB0aGUgZ2xpYmMgZmFsbGJhY2sgY29kZSBpcyBwcm9iYWJseSBzb21ldGhpbmcg
dGhhdCB3aWxsIGVuZCB1cCBiZWluZwo+ID4gdXNlZCBpZiBzb21lb25lIHdhbnRzIHRvIHJ1biBh
cHBsaWNhdGlvbiB0aGF0IHVzZXMgdGhpcyBzeXNjYWxsIG9uIEJTRAo+IAo+IE9yIExpbnV4IGtl
cm5lbCA8IDQuNS4KCkxpbnV4IGtlcm5lbCA0LjUgaXMgYWJvdXQgdHdvIHllYXJzIG9sZGVyIHRo
YW4gZ2xpYmMgMi4yNyB0aGF0CmltcGxlbWVudHMgdGhlIGVtdWxhdGlvbiwgc28gSSBkb3VidCB0
aGF0IHNvbWVvbmUgd2lsbCBhY3R1YWxseSBydW4gdGhpcwpjb21iaW5hdGlvbi4KCi0tIApDeXJp
bCBIcnViaXMKY2hydWJpc0BzdXNlLmN6CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8v
bGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
