Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A3D43769
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 16:57:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC02D3EA7DC
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 16:57:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 9EACF3EA787
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 16:57:47 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9C929600F00
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 16:57:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5635F223885;
 Thu, 13 Jun 2019 14:57:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CC3C7C557;
 Thu, 13 Jun 2019 14:57:39 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 41C3A1806B16;
 Thu, 13 Jun 2019 14:57:38 +0000 (UTC)
Date: Thu, 13 Jun 2019 10:57:35 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <1211798607.28016198.1560437855198.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190613141714.GC29926@rei.lan>
References: <adca7c08dbf20805da9b99a7fa03d498de70235d.1560410182.git.jstancek@redhat.com>
 <1b6ddab9cd8e3620da9e37b1132e911280c22e32.1560410182.git.jstancek@redhat.com>
 <CAEemH2frt_zGSdSRL3d_J+km74p8ruQTNF6bVhEpaiTdMLCC6A@mail.gmail.com>
 <1320546599.27920597.1560420988025.JavaMail.zimbra@redhat.com>
 <20190613141714.GC29926@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.56, 10.4.195.4]
Thread-Topic: syscalls/ioctl_ns0[156]: align stack and wait for child
Thread-Index: S3zJxaOr/YNTq1oCcxs46dBK82RTKg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Thu, 13 Jun 2019 14:57:40 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v3 3/3] syscalls/ioctl_ns0[156]: align stack and
 wait for child
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

Ci0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiBIaSEKPiA+ID4gV2UgbmVlZCBmcmVlKGNo
aWxkX3N0YWNrKSBpbiB0aGUgY2xlYW51cCBmdW5jdGlvbi4KPiA+IAo+ID4gQ2FuIHlvdSBlbGFi
b3JhdGU/Cj4gCj4gSWYgSSByZW1lbWJlciBjb3JyZWN0bHkgYXQgc29tZSBwb2ludCB3ZSBkZWNp
ZGVkIHRvIGNsZWFuIHVwIGFmdGVyIHRlc3RzCj4gcHJvcGVybHkgc28gdGhhdCB3ZSBkb24ndCB1
cHNldCB2YXJpb3VzIGRlYnVnZ2luZyB0b29scywgaS5lLiBjb3Zlcml0eSwKPiB2YWxncmluZCwg
ZXRjLiBhbmQgSSB0aGluayB0aGF0IHlvdSB3ZXJlIHBhcnQgb2YgdGhhdCBkaXNjdXNzaW9uLgoK
SSByZWNhbGwgSSBzdGFydGVkIHdpdGggdGhhdCBwb3NpdGlvbiAoZnJlZSBhbGwpLCBhbmQgSSB0
aG91Z2h0IHlvdQp0dXJuZWQgbWUgYXJvdW5kIGFmdGVyIHRoaXMgbWFueSB5ZWFycyA6LSkuCgpE
byB3ZSBoYXZlIGFueXRoaW5nIGFib3V0IHRoaXMgaW4gc3R5bGUgZ3VpZGU/IEkgb25seSBmb3Vu
ZCBicmllZiBtZW50aW9uIAppbiAiZG9uJ3QgY2FsbCBjbGVhbnVwIGZyb20gc2V0dXAiIHNlY3Rp
b24sIHdoaWNoIGlzbid0IGV2ZW4gcG9zc2libGUgd2l0aCBuZXdsaWIuCgouLi4KWW91IGRvbid0
IG5lZWQgdG8gY2xlYW4gdXAgdGhlIGZvbGxvd2luZzogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgCiAqICttYWxsb2MoMykrJ2VkIG1lbW9yeS4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAK
ICogUmVhZC1vbmx5IGZpbGUgZGVzY3JpcHRvcnMgaW4gcGVyc2lzdGVudCBwYXRocyAoaS5lLiBu
b3QgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICB0ZW1wb3JhcnkgZGly
ZWN0b3JpZXMpLiAgCgo+IAo+IC0tCj4gQ3lyaWwgSHJ1YmlzCj4gY2hydWJpc0BzdXNlLmN6Cj4g
CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8v
bHRwCg==
