Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 014D917CC3
	for <lists+linux-ltp@lfdr.de>; Wed,  8 May 2019 17:04:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C1948294AD4
	for <lists+linux-ltp@lfdr.de>; Wed,  8 May 2019 17:04:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 466E43EACC4
 for <ltp@lists.linux.it>; Wed,  8 May 2019 17:04:24 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A941B1A0153C
 for <ltp@lists.linux.it>; Wed,  8 May 2019 17:04:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E4C45C00735C;
 Wed,  8 May 2019 15:04:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA9C1608E4;
 Wed,  8 May 2019 15:04:21 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC06518089C8;
 Wed,  8 May 2019 15:04:21 +0000 (UTC)
Date: Wed, 8 May 2019 11:04:19 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <1178223584.21691194.1557327858998.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190508052318.9020-3-liwang@redhat.com>
References: <20190508052318.9020-3-liwang@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.34, 10.4.195.25]
Thread-Topic: libltpnuma: remove restrictions on numa node-id
Thread-Index: jnYDaR25ycsMJO1nwa1ysBJqs5m+hQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Wed, 08 May 2019 15:04:21 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 2/2] libltpnuma: remove restrictions on numa
 node-id
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

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gRm9yIHNvbWUgcHBjNjRsZSBzeXN0ZW1z
LCBpdCBoYXMgbm9uLWNvbnRpbnVvdXMgbnVtYSBub2RlcyBpbgo+IGhhcmR3YXJlIGNvbmZpZ3Vy
YXRpb24uIFNvIHdlJ3JlIGhpdHRpbmcgdGhlIGJlbG93IHdhcm5pbmdzIHdoaWxlCj4gcnVubmlu
ZyBzZXRfbWVtcG9saWN5IHRlc3RzIG9uIHRoYXQuIFRvIGZpeCB0aGlzIGlzc3VlLCBsZXQncyBq
dXN0Cj4gcmVtb3ZlIHJlc3RyaWN0aW9ucyBvbiBudW1hIG5vZGUtaWQgaW4gZ2V0X21lbXBvbGlj
eSgpLgo+IAo+IEVycm9yIExvZwo+IC0tLS0tLS0tLQo+IHRzdF90ZXN0LmM6MTA5NjogSU5GTzog
VGltZW91dCBwZXIgcnVuIGlzIDBoIDUwbSAwMHMKPiB0c3RfbnVtYS5jOjE5MDogSU5GTzogRm91
bmQgMiBOVU1BIG1lbW9yeSBub2Rlcwo+IHNldF9tZW1wb2xpY3kwMS5jOjYzOiBQQVNTOiBzZXRf
bWVtcG9saWN5KE1QT0xfQklORCkgbm9kZSAwCj4gdHN0X251bWEuYzoyNjogSU5GTzogTm9kZSAw
IGFsbG9jYXRlZCAxNiBwYWdlcwo+IHRzdF9udW1hLmM6MjY6IElORk86IE5vZGUgOCBhbGxvY2F0
ZWQgMCBwYWdlcwo+IHNldF9tZW1wb2xpY3kwMS5jOjgyOiBQQVNTOiBjaGlsZDogTm9kZSAwIGFs
bG9jYXRlZCAxNgo+IHNldF9tZW1wb2xpY3kwMS5jOjYzOiBQQVNTOiBzZXRfbWVtcG9saWN5KE1Q
T0xfQklORCkgbm9kZSA4Cj4gdHN0X251bWEuYzo5MjogV0FSTjogZ2V0X21lbXBvbGljeSguLi4p
IHJldHVybmVkIGludmFsaWQgbm9kZSA4Cj4gdHN0X251bWEuYzo5MjogV0FSTjogZ2V0X21lbXBv
bGljeSguLi4pIHJldHVybmVkIGludmFsaWQgbm9kZSA4Cj4gdHN0X251bWEuYzo5MjogV0FSTjog
Z2V0X21lbXBvbGljeSguLi4pIHJldHVybmVkIGludmFsaWQgbm9kZSA4Cj4gLi4uCj4gdHN0X251
bWEuYzoyNjogSU5GTzogTm9kZSAwIGFsbG9jYXRlZCAwIHBhZ2VzCj4gdHN0X251bWEuYzoyNjog
SU5GTzogTm9kZSA4IGFsbG9jYXRlZCAwIHBhZ2VzCj4gc2V0X21lbXBvbGljeTAxLmM6ODY6IEZB
SUw6IGNoaWxkOiBOb2RlIDggYWxsb2NhdGVkIDAsIGV4cGVjdGVkIDE2Cj4gCj4gbHNjcHUKPiAt
LS0tLQo+IEFyY2hpdGVjdHVyZTogICAgICAgIHBwYzY0bGUKPiAuLi4KPiBDUFUocyk6ICAgICAg
ICAgICAgICAxMjgKPiBDb3JlKHMpIHBlciBzb2NrZXQ6ICAxNgo+IFNvY2tldChzKTogICAgICAg
ICAgIDIKPiBOVU1BIG5vZGUocyk6ICAgICAgICAyCj4gTW9kZWwgbmFtZTogICAgICAgICAgUE9X
RVI5LCBhbHRpdmVjIHN1cHBvcnRlZAo+IC4uLgo+IE5VTUEgbm9kZTAgQ1BVKHMpOiAgIDAtNjMK
PiBOVU1BIG5vZGU4IENQVShzKTogICA2NC0xMjcKPiAKPiBTaWduZWQtb2ZmLWJ5OiBMaSBXYW5n
IDxsaXdhbmdAcmVkaGF0LmNvbT4KPiAtLS0KPiAgbGlicy9saWJsdHBudW1hL3RzdF9udW1hLmMg
fCA1ICsrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xpYnMvbGlibHRwbnVtYS90c3RfbnVtYS5jIGIvbGlicy9s
aWJsdHBudW1hL3RzdF9udW1hLmMKPiBpbmRleCAwYmE2ZGFmMzkuLjU2Yzg2NDBmZiAxMDA2NDQK
PiAtLS0gYS9saWJzL2xpYmx0cG51bWEvdHN0X251bWEuYwo+ICsrKyBiL2xpYnMvbGlibHRwbnVt
YS90c3RfbnVtYS5jCj4gQEAgLTg4LDggKzg4LDkgQEAgdm9pZCB0c3Rfbm9kZW1hcF9jb3VudF9w
YWdlcyhzdHJ1Y3QgdHN0X25vZGVtYXAgKm5vZGVzLAo+ICAJCWlmIChyZXQgPCAwKQo+ICAJCQl0
c3RfYnJrKFRCUk9LIHwgVEVSUk5PLCAiZ2V0X21lbXBvbGljeSgpIGZhaWxlZCIpOwo+ICAKPiAt
CQlpZiAobm9kZSA8IDAgfHwgKHVuc2lnbmVkIGludClub2RlID49IG5vZGVzLT5jbnQpIHsKPiAt
CQkJdHN0X3JlcyhUV0FSTiwgImdldF9tZW1wb2xpY3koLi4uKSByZXR1cm5lZCBpbnZhbGlkIG5v
ZGUgJWlcbiIsIG5vZGUpOwo+ICsJCWlmIChub2RlIDwgMCkgewo+ICsJCQl0c3RfcmVzKFRXQVJO
LAo+ICsJCQkJImdldF9tZW1wb2xpY3koLi4uKSByZXR1cm5lZCBpbnZhbGlkIG5vZGUgJWlcbiIs
IG5vZGUpOwo+ICAJCQljb250aW51ZTsKPiAgCQl9Cj4gIAo+IC0tCj4gMi4yMC4xCgoyLzIgbG9v
a3MgZ29vZCB0byBtZToKCkFja2VkLWJ5OiBKYW4gU3RhbmNlayA8anN0YW5jZWtAcmVkaGF0LmNv
bT4KCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5m
by9sdHAK
