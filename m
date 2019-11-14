Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96113FCF4D
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Nov 2019 21:11:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E82DE3C1CAB
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Nov 2019 21:11:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 738233C02C3
 for <ltp@lists.linux.it>; Thu, 14 Nov 2019 21:11:14 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id A408F1A00EA1
 for <ltp@lists.linux.it>; Thu, 14 Nov 2019 21:11:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573762271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VTSMW7yiszdsz9+obyoZO8enMubl8X2pXKrcjl0PUMI=;
 b=TxTyrN9ZExxoycdWx5XlYHU/ui9PTx8Yj9lbrVf5CK8ONDu9SveWFYU/AhEvpYK0MGP7Lf
 DB+IibyRkpJoCWrOlpZ43wk9ymYszX/nSpvW8Y6LURIXzRiCvCLnpyNLe924dtrinNT7/3
 4RBptn+w0XEU46aW3vgC0ISJ2w8hBEo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-40nTPR-8OIWJANFhu8z5Yw-1; Thu, 14 Nov 2019 15:11:08 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66D7CDB60;
 Thu, 14 Nov 2019 20:11:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5779C60BE1;
 Thu, 14 Nov 2019 20:11:05 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id B2F454BB5C;
 Thu, 14 Nov 2019 20:11:04 +0000 (UTC)
Date: Thu, 14 Nov 2019 15:11:04 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Message-ID: <247236994.12271471.1573762264445.JavaMail.zimbra@redhat.com>
In-Reply-To: <CA+G9fYtpOaYDoUEzQuYxmKJLFH2GDvK3ipWienn-zHDB+nOMbg@mail.gmail.com>
References: <20191114193132.5de921a7@canb.auug.org.au>
 <CA+G9fYtpOaYDoUEzQuYxmKJLFH2GDvK3ipWienn-zHDB+nOMbg@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.254, 10.4.195.5]
Thread-Topic: linux-next: Tree for Nov 14
Thread-Index: YqTkoYhDRfL/aNkJZ5JfFnjXrrr8Bg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 40nTPR-8OIWJANFhu8z5Yw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] linux-next: Tree for Nov 14
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 lkft-triage@lists.linaro.org, Mark Brown <broonie@kernel.org>,
 John Stultz <john.stultz@linaro.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>, linux-clk@vger.kernel.org,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gT24gVGh1LCAxNCBOb3YgMjAxOSBhdCAx
NDowMSwgU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+IHdyb3RlOgo+ID4K
PiA+IEhpIGFsbCwKPiA+IENoYW5nZXMgc2luY2UgMjAxOTExMTM6Cj4gPiBUaGUgeTIwMzggdHJl
ZSBnYWluZWQgYSBidWlsZCBmYWlsdXJlIGZvciB3aGljaCBJIGFwcGxpZWQgYSBwYXRjaC4KPiA8
dHJpbT4KPiA+IFRoZSBha3BtLWN1cnJlbnQgdHJlZSBnYWluZWQgYSBjb25mbGljdCBhZ2FpbnN0
IHRoZSB5MjAzOCB0cmVlLgo+ID4KPiA+IE5vbi1tZXJnZSBjb21taXRzIChyZWxhdGl2ZSB0byBM
aW51cycgdHJlZSk6IDEwMzg4Cj4gPiAgOTIzOCBmaWxlcyBjaGFuZ2VkLCAzOTczNTcgaW5zZXJ0
aW9ucygrKSwgMTc0MTcxIGRlbGV0aW9ucygtKQo+IAo+IFJlc3VsdHMgZnJvbSBMaW5hcm/igJlz
IHRlc3QgZmFybS4KPiBSZWdyZXNzaW9ucyBkZXRlY3RlZCBvbiB4ODZfNjQsIGFuZCBpMzg2Lgo+
IAo+IExUUCBzeXNjYWxscyBzZXR0aW1lb2ZkYXkwMS8wMiBmYWlsZWQgb24geDg2XzY0IGFuZCBp
Mzg2IHJ1bm5pbmcKPiA1LjQuMC1yYzctbmV4dC0yMDE5MTExNC4KPiAKPiBGb2xsb3dpbmcgIGx0
cC1zeXNjYWxscy10ZXN0cyBmYWlsZWQuCj4gICAgICogc2V0dGltZW9mZGF5MDEKPiAgICAgKiBz
ZXR0aW1lb2ZkYXkwMgo+ICAgICAqIHN0aW1lMDEKPiAgICAgKiBzdGltZTAyCgpMb29rcyBsaWtl
IHR5cG8gaW4KYWRkZTc0MzA2YTRiICgieTIwMzg6IHRpbWU6IGF2b2lkIHRpbWVzcGVjIHVzYWdl
IGluIHNldHRpbWVvZmRheSgpIikKCi0gICAgICAgICAgICAgICBpZiAoIXRpbWV2YWxfdmFsaWQo
JnVzZXJfdHYpKQorICAgICAgICAgICAgICAgaWYgKHR2LT50dl91c2VjID4gVVNFQ19QRVJfU0VD
KQoKd2FzIGxpa2VseSBtZWFudCBhczoKCi0gICAgICAgICAgICAgICBpZiAoIXRpbWV2YWxfdmFs
aWQoJnVzZXJfdHYpKQorICAgICAgICAgICAgICAgaWYgKG5ld190cy50dl9uc2VjID4gVVNFQ19Q
RVJfU0VDKQoKc2luY2UgdHYgaXMgdXNlciBwb2ludGVyLgoKCi0tIApNYWlsaW5nIGxpc3QgaW5m
bzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
