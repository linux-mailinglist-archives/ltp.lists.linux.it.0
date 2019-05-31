Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A73F30DB2
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 14:00:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 46ED7390298
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 14:00:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 2F2C83EA19D
 for <ltp@lists.linux.it>; Fri, 31 May 2019 14:00:14 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2CF80601C7B
 for <ltp@lists.linux.it>; Fri, 31 May 2019 14:00:12 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5272AAEC2;
 Fri, 31 May 2019 12:00:12 +0000 (UTC)
Date: Fri, 31 May 2019 14:00:11 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190531120011.GB8819@rei.lan>
References: <1559292243-2882-1-git-send-email-huangjh.jy@cn.fujitsu.com>
 <20190531110122.GA8819@rei.lan>
 <CAEemH2eU+xcrDuW5UV=VCWhmHqrtOTE3HV=1Dr8cU8FWsBfLnw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2eU+xcrDuW5UV=VCWhmHqrtOTE3HV=1Dr8cU8FWsBfLnw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH] syscalls/copy_file_range02.c: Compatible with new
 and old kernels
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

SGkhCj4gVGhpcyBpcyBhIGdvb2Qgc3VnZ2VzdGlvbi4gQW5vdGhlciBwb2ludCBJIGNhbiBjb21l
IHVwIGlzLCBpZiBhbiBMVFMgTGludXgKPiBkaXN0cmlidXRpb24gYmFja3BvcnRzIHRoYXQgY29t
bWl0IDExY2JmYjEwNzc1YSB0byB0aGVpciBvbGQga2VybmVsIGFzCj4gcmVncmVzc2lvbiBmaXgs
IHRoZW4gdGhpcyBmbGFnIHdpbGwgbWFrZSBubyBzZW5zZS4KCldlbGwgdGhhdCdzIGxpZmUsIHRo
ZXJlIGlzIG5vIHdheSBob3cgdG8gZGV0ZWN0IGlmIHBhdGNoIHdhcyBiYWNrcG9ydGVkCm9yIG5v
dCwgc28gZWl0aGVyIHdlIG1ha2UgdGhlIHRlc3QgcGFzcyBvbiBib3RoIEVJU0RJUiBhbmQgRUJB
REZEIG9uCm9sZGVyIGtlcm5lbHMgb3Igd2UgbGVhdmUgaXQgYXMgaXQgaXMuIE5laXRoZXIgb2Yg
dGhlIHNvbHV0aW9ucyBpcwpwZXJmZWN0LgoKPiBTbywgdG8gc3RyaWN0IHdlIG1heWJlIG5lZWQg
dG8gcmVnYXJkcyB0aGUgRUlTRElSIGFzIHRoZSBvbmx5IG9uZSBsZWdhbAo+IGVycm5vKGNvcHlp
bmcgY29udGVudCB0byBkaXIpIHdoZW4gIGtlcm5lbCA+PSA0LjEwKGluY2x1ZGVzIGNvbW1pdAo+
IDExY2JmYjEwNzc1YSkuCgpZZXMsIGV4YWN0bHkuCgotLSAKQ3lyaWwgSHJ1YmlzCmNocnViaXNA
c3VzZS5jegoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xp
c3RpbmZvL2x0cAo=
