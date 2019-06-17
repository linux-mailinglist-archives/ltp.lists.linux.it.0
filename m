Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E92149482
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 23:44:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 63EFA3EB055
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 23:44:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id C08CF3EA441
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 23:44:24 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 980C76005CF
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 23:44:26 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3AB3F30872CA
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 21:44:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3046C61369
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 21:44:17 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 20FD61806B0E;
 Mon, 17 Jun 2019 21:44:17 +0000 (UTC)
Date: Mon, 17 Jun 2019 17:44:13 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <1243296203.28755912.1560807853881.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190615042048.29839-3-liwang@redhat.com>
References: <20190615042048.29839-1-liwang@redhat.com>
 <20190615042048.29839-3-liwang@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.242, 10.4.195.29]
Thread-Topic: testcase: get rid of compiling errors
Thread-Index: sQ227OGVX7uAMsqI4pHvamE6njgPWw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Mon, 17 Jun 2019 21:44:17 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 3/3] testcase: get rid of compiling errors
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

Ci0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiBTaWduZWQtb2ZmLWJ5OiBMaSBXYW5nIDxs
aXdhbmdAcmVkaGF0LmNvbT4KPiAtLS0KPiAgY29uZmlndXJlLmFjICAgICAgICAgICAgIHwgMSAr
Cj4gIHRlc3RjYXNlcy9jdmUvbWVsdGRvd24uYyB8IDUgKysrKysKPiAgMiBmaWxlcyBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmln
dXJlLmFjCj4gaW5kZXggNWVjYzkyNzgxLi41MjFmNTY1NDEgMTAwNjQ0Cj4gLS0tIGEvY29uZmln
dXJlLmFjCj4gKysrIGIvY29uZmlndXJlLmFjCj4gQEAgLTU4LDYgKzU4LDcgQEAgQUNfQ0hFQ0tf
SEVBREVSUyhbIFwKPiAgICAgIHN5cy9zaG0uaCBcCj4gICAgICBzeXMvdXN0YXQuaCBcCj4gICAg
ICBzeXMveGF0dHIuaCBcCj4gKyAgICBlbW1pbnRyaW4uaCBcCj4gIF0pCj4gIAo+ICBBQ19DSEVD
S19GVU5DUyhbIFwKPiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2N2ZS9tZWx0ZG93bi5jIGIvdGVz
dGNhc2VzL2N2ZS9tZWx0ZG93bi5jCj4gaW5kZXggNzJjOWVjOTA3Li5iYzY0OWI4OTMgMTAwNjQ0
Cj4gLS0tIGEvdGVzdGNhc2VzL2N2ZS9tZWx0ZG93bi5jCj4gKysrIGIvdGVzdGNhc2VzL2N2ZS9t
ZWx0ZG93bi5jCj4gQEAgLTI5LDYgKzI5LDcgQEAKPiAgI2luY2x1ZGUgPGN0eXBlLmg+Cj4gICNp
bmNsdWRlIDxzeXMvdXRzbmFtZS5oPgo+ICAKPiArI2lmZGVmIEhBVkVfRU1NSU5UUklOX0gKPiAg
I2luY2x1ZGUgPGVtbWludHJpbi5oPgo+ICAKPiAgI2luY2x1ZGUgImxpYnRzYy5oIgo+IEBAIC0z
ODcsMyArMzg4LDcgQEAgc3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0ZXN0ID0gewo+ICAJLmNsZWFu
dXAgPSBjbGVhbnVwLAo+ICAJLm1pbl9rdmVyID0gIjIuNi4zMiIKPiAgfTsKPiArCj4gKyNlbHNl
IC8qIEhBVkVfRU1NSU5UUklOX0ggKi8KPiArCVRTVF9URVNUX1RDT05GKCI8ZW1taW50cmluLmg+
IGlzIG5vdCBzdXBwb3J0ZWQiKTsKPiArI2VuZGlmCgpUaGlzIHNlZW1zIG1vcmUgY29tcGxpY2F0
ZWQgdG8gbWUgdGhhbiBvcmlnaW5hbCAtIGV4dHJhIGF1dG9jb25mIGNoZWNrLCBleHRyYSBpZmRl
Zi4KCkkgY2FuIHNlZSBob3cgdHN0X29uX2FyY2goKSB3b3VsZCBiZSB1c2VmdWwuIFRlc3QgaXMg
dmFsaWQgb24gYWxsIGFyY2hlcywKYnV0IG5lZWRzIGRpZmZlcmVudCBpbnB1dC9jb25zdGFudHMv
Y29kZS9ldGMuCgpXaGF0IGlzIHRoZSBtb3RpdmF0aW9uIGZvciB0c3RfdGVzdC5hcmNoPyBJcyBp
dCB0byBoYXZlIHNvbWUgYW5ub3RhdGlvbiBpbiB0c3RfdGVzdCBzdHJ1Y3Q/Cgo+IC0tCj4gMi4y
MC4xCj4gCj4gCj4gLS0KPiBNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5p
dC9saXN0aW5mby9sdHAKPiAKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5s
aW51eC5pdC9saXN0aW5mby9sdHAK
