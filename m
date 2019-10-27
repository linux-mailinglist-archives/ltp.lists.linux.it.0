Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A36E61D8
	for <lists+linux-ltp@lfdr.de>; Sun, 27 Oct 2019 10:32:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B055D3C22A1
	for <lists+linux-ltp@lfdr.de>; Sun, 27 Oct 2019 10:32:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id A2EB13C2298
 for <ltp@lists.linux.it>; Sun, 27 Oct 2019 10:32:32 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 5B17C1A004C9
 for <ltp@lists.linux.it>; Sun, 27 Oct 2019 10:32:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572168748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Brt12eroTnBSuocOIrOnaBRgY6eEG5OTxhduVRLWoHo=;
 b=Foy+IQiBFA5qr0yw7PF5LDliG5lExjfOPaClud28h6u+OvrA3sGi06YDkX0BzjqTI3wVjx
 bUgQfySiHccCHandGy8VOh4aYRMpDVsG/UAtVBR62L9+FAQnDyrDe/UQIcn0nzMvGEHG+W
 MHXMIq8ptmlEDbA3epz2/e6X8V/nsYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-xLzG1hxvNamOpilH46Ypcw-1; Sun, 27 Oct 2019 05:32:24 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A891E801E56;
 Sun, 27 Oct 2019 09:32:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A040E90AB;
 Sun, 27 Oct 2019 09:32:23 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8D04D1808878;
 Sun, 27 Oct 2019 09:32:23 +0000 (UTC)
Date: Sun, 27 Oct 2019 05:32:23 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>, LTP List <ltp@lists.linux.it>
Message-ID: <2111263587.9218283.1572168743324.JavaMail.zimbra@redhat.com>
In-Reply-To: <CA+G9fYurG8gSO+xFc5LJvLMrqTyHG85oxH9=pSQ1LmPCa6PkqQ@mail.gmail.com>
References: <cki.61C56EFD16.AR8ITWHB7P@redhat.com>
 <CA+G9fYurG8gSO+xFc5LJvLMrqTyHG85oxH9=pSQ1LmPCa6PkqQ@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.1]
Thread-Topic: =?utf-8?B?4p2MIEZBSUw6?= Stable queue: queue-5.3
Thread-Index: gNe4i/TBRrbrR5tiA3xma7jiYmwpjA==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: xLzG1hxvNamOpilH46Ypcw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] =?utf-8?b?4p2MIEZBSUw6IFN0YWJsZSBxdWV1ZTogcXVldWUtNS4z?=
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
Cc: Memory Management <mm-qe@redhat.com>, CKI Project <cki-project@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gSGkgSmFuLAo+IAo+IE9uIFN1biwgMjcg
T2N0IDIwMTkgYXQgMDQ6MDQsIENLSSBQcm9qZWN0IDxja2ktcHJvamVjdEByZWRoYXQuY29tPiB3
cm90ZToKPiA+Cj4gPgo+ID4gSGVsbG8sCj4gPgo+ID4gV2UgcmFuIGF1dG9tYXRlZCB0ZXN0cyBv
biBhIHBhdGNoc2V0IHRoYXQgd2FzIHByb3Bvc2VkIGZvciBtZXJnaW5nIGludG8KPiA+IHRoaXMK
PiA+IGtlcm5lbCB0cmVlLiBUaGUgcGF0Y2hlcyB3ZXJlIGFwcGxpZWQgdG86Cj4gPgo+ID4gICAg
ICAgIEtlcm5lbCByZXBvOgo+ID4gICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQKPiA+ICAgICAgICAgICAgIENvbW1p
dDogMzY1ZGFiNjFmNzRlIC0gTGludXggNS4zLjcKPiA+Cj4gPiBUaGUgcmVzdWx0cyBvZiB0aGVz
ZSBhdXRvbWF0ZWQgdGVzdHMgYXJlIHByb3ZpZGVkIGJlbG93Lgo+ID4KPiA+ICAgICBPdmVyYWxs
IHJlc3VsdDogRkFJTEVEIChzZWUgZGV0YWlscyBiZWxvdykKPiA+ICAgICAgICAgICAgICBNZXJn
ZTogT0sKPiA+ICAgICAgICAgICAgQ29tcGlsZTogT0sKPiA+ICAgICAgICAgICAgICBUZXN0czog
RkFJTEVECj4gPgo+ID4gQWxsIGtlcm5lbCBiaW5hcmllcywgY29uZmlnIGZpbGVzLCBhbmQgbG9n
cyBhcmUgYXZhaWxhYmxlIGZvciBkb3dubG9hZAo+ID4gaGVyZToKPiA+Cj4gPiAgIGh0dHBzOi8v
YXJ0aWZhY3RzLmNraS1wcm9qZWN0Lm9yZy9waXBlbGluZXMvMjQ5NTc2Cj4gPgo+ID4gT25lIG9y
IG1vcmUga2VybmVsIHRlc3RzIGZhaWxlZDoKPiA+Cj4gPiAgICAgeDg2XzY0Ogo+ID4gICAgICDi
nYwgTFRQIGxpdGUKPiAKPiBJIHNlZSB0aGVzZSB0aHJlZSBmYWlsdXJlcyBmcm9tIHRoZSBsb2dz
LAoKW0NDIExUUCBsaXN0XQoKPiAKPiBMVFAgc3lzY2FsbHM6Cj4gZmFsbG9jYXRlMDUgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRkFJTCAgICAgICAxCgp0c3RfbWtmcy5j
Ojg5OiBJTkZPOiBGb3JtYXR0aW5nIC9kZXYvbG9vcDAgd2l0aCBleHQ0IG9wdHM9JycgZXh0cmEg
b3B0cz0nJwpta2UyZnMgMS40NS4zICgxNC1KdWwtMjAxOSkKdHN0X3Rlc3QuYzoxMTE2OiBJTkZP
OiBUaW1lb3V0IHBlciBydW4gaXMgMGggMDVtIDAwcwp0c3RfZmlsbF9mcy5jOjI5OiBJTkZPOiBD
cmVhdGluZyBmaWxlIG1udHBvaW50L2ZpbGUwIHNpemUgMjE3MTAxODMKdHN0X2ZpbGxfZnMuYzoy
OTogSU5GTzogQ3JlYXRpbmcgZmlsZSBtbnRwb2ludC9maWxlMSBzaXplIDgwNzAwODYKdHN0X2Zp
bGxfZnMuYzoyOTogSU5GTzogQ3JlYXRpbmcgZmlsZSBtbnRwb2ludC9maWxlMiBzaXplIDM5NzEx
NzcKdHN0X2ZpbGxfZnMuYzoyOTogSU5GTzogQ3JlYXRpbmcgZmlsZSBtbnRwb2ludC9maWxlMyBz
aXplIDM2OTE1MzE1CnRzdF9maWxsX2ZzLmM6Mjk6IElORk86IENyZWF0aW5nIGZpbGUgbW50cG9p
bnQvZmlsZTQgc2l6ZSA3MDMxMDk5Mwp0c3RfZmlsbF9mcy5jOjI5OiBJTkZPOiBDcmVhdGluZyBm
aWxlIG1udHBvaW50L2ZpbGU1IHNpemUgNDgwNzkzNQp0c3RfZmlsbF9mcy5jOjI5OiBJTkZPOiBD
cmVhdGluZyBmaWxlIG1udHBvaW50L2ZpbGU2IHNpemUgOTA3Mzk3ODYKdHN0X2ZpbGxfZnMuYzoy
OTogSU5GTzogQ3JlYXRpbmcgZmlsZSBtbnRwb2ludC9maWxlNyBzaXplIDc2ODk2NDkyCnRzdF9m
aWxsX2ZzLmM6NDk6IElORk86IHdyaXRlKCk6IEVOT1NQQyAoMjgpCmZhbGxvY2F0ZTA1LmM6NTA6
IFBBU1M6IHdyaXRlKCkgd3JvdGUgODE5MiBieXRlcwpmYWxsb2NhdGUwNS5jOjU0OiBGQUlMOiBm
YWxsb2NhdGUoKSBzdWNjZWVkZWQgdW5leHBlY3RlZGx5CgpTbywgdGVzdCBmaWxsZWQgZmlsZXN5
c3RlbSBhbmQgZmFsbG9jYXRlKCkgc3VjY2VlZGVkIGFueXdheS4KCj4gCj4gTFRQIG1tOgo+IG9v
bTAzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEZBSUwgICAg
ICAgMgo+IG9vbTA1ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IEZBSUwgICAgICAgMgoKVGhpcyBsb29rcyBsaWtlIHRlc3QgaXNzdWUuIHN5c3RlbWQgb24gRmVk
b3JhMzEgc3RhcnRlZCB1c2luZyBjZ3JvdXAyIGV4Y2x1c2l2ZWx5OgogIGNncm91cDIgb24gL3N5
cy9mcy9jZ3JvdXAgdHlwZSBjZ3JvdXAyIChydyxub3N1aWQsbm9kZXYsbm9leGVjLHJlbGF0aW1l
LHNlY2xhYmVsLG5zZGVsZWdhdGUpCgpUZXN0cyBhcmUgdHJ5aW5nIHRvIG1vdW50IHNpbmdsZSBo
aWVyYXJjaHkgb24gY2dyb3VwMToKW3BpZCAyODM5MzNdIDA0OjU3OjI2IG1rZGlyKCIvZGV2L2Nn
cm91cCIsIDA3NzcpID0gMApbcGlkIDI4MzkzM10gMDQ6NTc6MjYgbW91bnQoIm1lbWNnIiwgIi9k
ZXYvY2dyb3VwIiwgImNncm91cCIsIDAsICJtZW1vcnkiKSA9IC0xIEVCVVNZIChEZXZpY2Ugb3Ig
cmVzb3VyY2UgYnVzeSkKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGlu
dXguaXQvbGlzdGluZm8vbHRwCg==
