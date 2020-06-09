Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 102C71F3843
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 12:42:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B34EB3C2E4B
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 12:42:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 2E2DA3C12D0
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 12:42:48 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 9477A601068
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 12:42:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591699365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z3A+G3Zu6kTVLbchQgSIh9wHsqXxBsBdnqluMp7Z5vg=;
 b=eXj4950sD2GxygPweEY5q8LXcgP8KRZ/D3WsiT89Br0I3Gmv/08gae7NAzuqykSme7yKxd
 wT7bhruzh64vVKQPiwnrIBl5e2T/d42uax9A670mwj6LfnHRUQ07wSF+K7VycUv1MbdXSE
 WASgged4xvjMMIZpxvqVXTZ8McL9l2Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-UcYnGfMXM4q6f4rs_kYJcg-1; Tue, 09 Jun 2020 06:42:44 -0400
X-MC-Unique: UcYnGfMXM4q6f4rs_kYJcg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DD00107ACCD
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 10:42:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47F638202E
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 10:42:43 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 412D0B3498;
 Tue,  9 Jun 2020 10:42:43 +0000 (UTC)
Date: Tue, 9 Jun 2020 06:42:42 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <1111554317.15300411.1591699362992.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200609095102.21153-1-liwang@redhat.com>
References: <20200609095102.21153-1-liwang@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.5]
Thread-Topic: add new cgroup test API
Thread-Index: rrfsSSRyCuEDbkUuIo+xhAVcrYd3UQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/4] lib: add new cgroup test API
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Ci0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiBNYW55IG9mIG91ciBMVFAgdGVzdHMgbmVl
ZCBDb250cm9sIEdyb3VwIGluIHRoZSBjb25maWd1cmF0aW9uLAo+IHRoaXMgcGF0Y2ggbWFrZXMg
Y2dyb3VwIHVuaWZpZWQgbW91bnRpbmcgYXQgc2V0dXAgcGhhc2UgdG8gYmUKPiBwb3NzaWJsZS4g
VGhlIG1ldGhvZMKgaXMgZXh0cmFjdGVkIGZyb20gbWVtLmggd2l0aCB0aGUgcHVycG9zZQo+IG9m
wqBleHRlbmRpYmxlIGZvciBmdXJ0aGVyIGRldmVsb3BpbmcsIGFuZCB0cnlpbmfCoHRvIGNvbXBh
dGlibGUKPiB0aGUgY3VycmVudCB0d28gdmVyc2lvbnMgb2YgY2dyb3VwLAo+IAo+IEl0J3MgaGFy
ZCB0byBtYWtlIGFsbCBBUElzIGJlIHN0cmljdGx5IGNvbnNpc3RlbnQgYmVjYXVzZSB0aGVyZQo+
IGFyZSBtYW55IGRpZmZlcmVuY2VzIGJldHdlZW4gdjEgYW5kIHYyLiBCdXQgaXTCoGNhcHN1bGF0
ZSB0aGUgZGV0YWlsCj4gb2YgY2dyb3VwIG1vdW50aW5nIGluIGhpZ2gtbGV2ZWwgZnVuY3Rpb25z
LCB3aGljaCB3aWxsIGJlIGVhc2llcgo+IHRvIHVzZSBjZ3JvdXAgd2l0aG91dCBjb25zaWRlcmlu
ZyB0b28gbXVjaCB0ZWNobmljYWwgdGhpbmcuCj4gCj4gQnR3LCB0ZXN0IGdldCBwYXNzZWQgb24g
UkhFTDcoeDg2XzY0KSwgUkhFTDgocHBjNjRsZSksIEZlZG9yYTMyKHg4Nl82NCkuCj4gCgpObyBz
dHJvbmcgb2JqZWN0aW9ucyB0byB2NCwgY291cGxlIGNvbW1lbnRzIGJlbG93IChpZiB5b3Ugc3Bp
biB2NSBiZWNhdXNlCm9mIG90aGVyIHJldmlld3MpLgoKPiArMi4yLjM2IFVzaW5nIENvbnRyb2wg
R3JvdXAKPiArXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl4KCldvdWxkIGJlIG5pY2UgaWYgdGhl
cmUgd2FzIHNob3J0IGRlc2NyaXB0aW9uIG9mIGVhY2ggZnVuY3Rpb24uCgo+ICtzdGF0aWMgdm9p
ZCB0c3RfY2dyb3VwX3NldF9wYXRoKGNvbnN0IGNoYXIgKmNncm91cF9kaXIpCj4gK3sKPiArCWNo
YXIgY2dyb3VwX25ld19kaXJbUEFUSF9NQVhdOwo+ICsJc3RydWN0IHRzdF9jZ3JvdXBfcGF0aCAq
dHN0X2Nncm91cF9wYXRoLCAqYTsKPiArCj4gKwlpZiAoIWNncm91cF9kaXIpCj4gKwkJdHN0X2Jy
ayhUQlJPSywgIkludmFsaWQgY2dyb3VwIGRpciwgcGxlc2UgY2hlY2sgY2dyb3VwX2RpciIpOwo+
ICsKPiArCXNwcmludGYoY2dyb3VwX25ld19kaXIsICIlcy9sdHBfJWQiLCBjZ3JvdXBfZGlyLCBy
YW5kKCkpOwo+ICsKPiArCS8qIFRvIHN0b3JlIGNncm91cCBwYXRoIGluIHRoZSAncGF0aCcgbGlz
dCAqLwo+ICsJdHN0X2Nncm91cF9wYXRoID0gU0FGRV9NTUFQKE5VTEwsIChzaXplb2Yoc3RydWN0
IHRzdF9jZ3JvdXBfcGF0aCkpLAo+ICsJCQlQUk9UX1JFQUQgfCBQUk9UX1dSSVRFLCBNQVBfUFJJ
VkFURSB8IE1BUF9BTk9OWU1PVVMsIC0xLCAwKTsKClRoaXMgbG9va3MgbGlrZSBpdCBjb3VsZCB1
c2UganVzdCBTQUZFX01BTExPQy9TQUZFX0ZSRUUuCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBo
dHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
