Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1A04859C
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 16:38:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 751BF3EB05C
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 16:38:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id ADF543EAE4E
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 16:38:13 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 568A41A010AE
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 16:38:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D4D1130BB37D;
 Mon, 17 Jun 2019 14:38:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD7037DF6A;
 Mon, 17 Jun 2019 14:38:11 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id C3669206D1;
 Mon, 17 Jun 2019 14:38:11 +0000 (UTC)
Date: Mon, 17 Jun 2019 10:38:08 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>, LTP List <ltp@lists.linux.it>
Message-ID: <894722811.28675645.1560782288619.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190617085039.GA1629@rei.lan>
References: <adca7c08dbf20805da9b99a7fa03d498de70235d.1560410182.git.jstancek@redhat.com>
 <CAEemH2frt_zGSdSRL3d_J+km74p8ruQTNF6bVhEpaiTdMLCC6A@mail.gmail.com>
 <1320546599.27920597.1560420988025.JavaMail.zimbra@redhat.com>
 <20190613141714.GC29926@rei.lan>
 <1211798607.28016198.1560437855198.JavaMail.zimbra@redhat.com>
 <20190613151419.GE29926@rei.lan>
 <151498464.28356667.1560670442630.JavaMail.zimbra@redhat.com>
 <20190617085039.GA1629@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.242, 10.4.195.16]
Thread-Topic: syscalls/ioctl_ns0[156]: align stack and wait for child
Thread-Index: M8S/9wQxg1BYQDoJGTJBjlgVGiwFDg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 17 Jun 2019 14:38:11 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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

Ci0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiBIaSEKPiA+ID4gPiBJIHJlY2FsbCBJIHN0
YXJ0ZWQgd2l0aCB0aGF0IHBvc2l0aW9uIChmcmVlIGFsbCksIGFuZCBJIHRob3VnaHQgeW91Cj4g
PiA+ID4gdHVybmVkIG1lIGFyb3VuZCBhZnRlciB0aGlzIG1hbnkgeWVhcnMgOi0pLgo+ID4gPiAK
PiA+ID4gV2VsbCBJIGRpZG4ndCBjYXJlIHRoYXQgbXVjaCwgYnV0IEkgZ3Vlc3MgdGhhdCBJIGxl
YW4gc2xpZ2h0bHkgdG8gZnJlZQo+ID4gPiB0aGUgbWVtb3J5IDotKS4KPiA+IAo+ID4gT0ssIHNv
IHNob3VsZCBJIHJlcG9zdCBvciBpcyB0aGlzIGdvb2QgdG8gZ28gd2l0aCBmcmVlIGFkZGVkIHRv
IGNsZWFudXA/Cj4gCj4gTGV0J3MgZG8gdGhhdC4KClB1c2hlZC4KKExpLCBJIGFkZGVkIHlvdXIg
QWNrZWQtYnkgdG8gaXQsIHNpbmNlIHlvdXIgY29tbWVudCBoYXMgYmVlbiBhZGRyZXNzZWQpLgoK
UmVnYXJkcywKSmFuCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXgu
aXQvbGlzdGluZm8vbHRwCg==
