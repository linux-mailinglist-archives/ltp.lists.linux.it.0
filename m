Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C249A1EA96
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 11:04:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9207B3EA251
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 11:04:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 738263EA16B
 for <ltp@lists.linux.it>; Wed, 15 May 2019 11:04:03 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5671E20147C
 for <ltp@lists.linux.it>; Wed, 15 May 2019 11:03:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2A1067BEE3;
 Wed, 15 May 2019 09:03:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EC105D9DC;
 Wed, 15 May 2019 09:03:56 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0B78F18089C9;
 Wed, 15 May 2019 09:03:56 +0000 (UTC)
Date: Wed, 15 May 2019 05:03:55 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <543317293.22835729.1557911035979.JavaMail.zimbra@redhat.com>
In-Reply-To: <CA+G9fYu254sYc77jOVifOmxrd_jNmr4wNHTrqnW54a8F=EQZ6Q@mail.gmail.com>
References: <CA+G9fYu254sYc77jOVifOmxrd_jNmr4wNHTrqnW54a8F=EQZ6Q@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.10]
Thread-Topic: overcommit_memory01, 03...06 failed
Thread-Index: nXsr2eOmSs8GKetOjInAzndms9fFPA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Wed, 15 May 2019 09:03:56 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: dengke du <dengke.du@windriver.com>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 linux-mm@kvack.org, ltp@lists.linux.it
Subject: Re: [LTP] LTP: mm: overcommit_memory01, 03...06 failed
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

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gbHRwLW1tLXRlc3RzIGZhaWxlZCBvbiBM
aW51eCBtYWlubGluZSBrZXJuZWwgIDUuMS4wLAo+ICAgKiBvdmVyY29tbWl0X21lbW9yeTAxIG92
ZXJjb21taXRfbWVtb3J5Cj4gICAqIG92ZXJjb21taXRfbWVtb3J5MDMgb3ZlcmNvbW1pdF9tZW1v
cnkgLVIgMzAKPiAgICogb3ZlcmNvbW1pdF9tZW1vcnkwNCBvdmVyY29tbWl0X21lbW9yeSAtUiA4
MAo+ICAgKiBvdmVyY29tbWl0X21lbW9yeTA1IG92ZXJjb21taXRfbWVtb3J5IC1SIDEwMAo+ICAg
KiBvdmVyY29tbWl0X21lbW9yeTA2IG92ZXJjb21taXRfbWVtb3J5IC1SIDIwMAo+IAo+IG1lbS5j
OjgxNDogSU5GTzogc2V0IG92ZXJjb21taXRfbWVtb3J5IHRvIDAKPiBvdmVyY29tbWl0X21lbW9y
eS5jOjE4NTogSU5GTzogbWFsbG9jIDgwOTQ4NDQga0Igc3VjY2Vzc2Z1bGx5Cj4gb3ZlcmNvbW1p
dF9tZW1vcnkuYzoyMDQ6IFBBU1M6IGFsbG9jIHBhc3NlZCBhcyBleHBlY3RlZAo+IG92ZXJjb21t
aXRfbWVtb3J5LmM6MTg5OiBJTkZPOiBtYWxsb2MgMzIzNzkzNzYga0IgZmFpbGVkCj4gb3ZlcmNv
bW1pdF9tZW1vcnkuYzoyMTA6IFBBU1M6IGFsbG9jIGZhaWxlZCBhcyBleHBlY3RlZAo+IG92ZXJj
b21taXRfbWVtb3J5LmM6MTg1OiBJTkZPOiBtYWxsb2MgMTYzNjAyMTYga0Igc3VjY2Vzc2Z1bGx5
Cj4gb3ZlcmNvbW1pdF9tZW1vcnkuYzoyMTI6IEZBSUw6IGFsbG9jIHBhc3NlZCwgZXhwZWN0ZWQg
dG8gZmFpbAo+IAo+IEZhaWxlZCB0ZXN0IGxvZywKPiBodHRwczovL2xrZnQudmFsaWRhdGlvbi5s
aW5hcm8ub3JnL3NjaGVkdWxlci9qb2IvNzI2NDE3I0wyMjg1Mgo+IAo+IExUUCB2ZXJzaW9uIDIw
MTkwMTE1Cj4gCj4gVGVzdCBjYXNlIGxpbmssCj4gaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXRl
c3QtcHJvamVjdC9sdHAvYmxvYi9tYXN0ZXIvdGVzdGNhc2VzL2tlcm5lbC9tZW0vdHVuYWJsZS9v
dmVyY29tbWl0X21lbW9yeS5jI0wyMTIKPiAKPiBGaXJzdCBiYWQgY29tbWl0Ogo+IGdpdCBicmFu
Y2ggbWFzdGVyCj4gZ2l0IGNvbW1pdCBlMDY1NDI2NGM0ODA2ZGM0MzZiMjkxMjk0YTBmYmY5YmU3
NTcxYWI2Cj4gZ2l0IGRlc2NyaWJlIHY1LjEtMTA3MDYtZ2UwNjU0MjY0YzQ4MAo+IGdpdCByZXBv
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRz
L2xpbnV4LmdpdAo+IAo+IExhc3QgZ29vZCBjb21taXQ6Cj4gZ2l0IGJyYW5jaCBtYXN0ZXIKPiBn
aXQgY29tbWl0IDdlOTg5MGEzNTAwZDk1YzAxNTExYTRjNDViN2U3MTkyZGZhNDdhZTIKPiBnaXQg
ZGVzY3JpYmUgdjUuMS0xMDMyNi1nN2U5ODkwYTM1MDBkCj4gZ2l0IHJlcG8gaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0CgpI
ZXVyaXN0aWMgY2hhbmdlZCBhIGJpdCBpbjoKICBjb21taXQgOGM3ODI5YjA0YzUyM2NkYzczMmNi
NzdmNTlmMDMzMjBlMDlmMzM4NgogIEF1dGhvcjogSm9oYW5uZXMgV2VpbmVyIDxoYW5uZXNAY21w
eGNoZy5vcmc+CiAgRGF0ZTogICBNb24gTWF5IDEzIDE3OjIxOjUwIDIwMTkgLTA3MDAKICAgIG1t
OiBmaXggZmFsc2UtcG9zaXRpdmUgT1ZFUkNPTU1JVF9HVUVTUyBmYWlsdXJlcwoKTFRQIHRyaWVz
IHRvIGFsbG9jYXRlICJtZW1fdG90YWwgKyBzd2FwX3RvdGFsIjoKICBhbGxvY19hbmRfY2hlY2so
c3VtX3RvdGFsLCBFWFBFQ1RfRkFJTCk7CndoaWNoIG5vdyBwcmVzdW1hYmx5IGZhbGxzIHNob3J0
IHRvIHRyaWdnZXIgZmFpbHVyZS4KCj4gCj4gQmVzdCByZWdhcmRzCj4gTmFyZXNoIEthbWJvanUK
PiAKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5m
by9sdHAK
