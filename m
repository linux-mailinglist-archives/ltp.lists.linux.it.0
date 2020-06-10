Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C51F41F554D
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 15:04:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 70DF83C2E26
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 15:04:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 58CE83C0196
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 15:04:08 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 4F38D1400DDC
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 15:04:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591794246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TPRcLL3xnHJR1bnf9n4+MI7you9NU+d3hUNYgJx+mnQ=;
 b=U0y9+okaosjdcthV14zZq0FL1CnqKlxHLK2DqOYVQ/lDqAnecd3nuMExBMK1CxCvzX6D6Z
 Rp8qwz5V7yxmDYXzIDMQDV14kTzrCo1MKjUve5uAONLY84a3pk3idZbEARDXmCTQLoWz9z
 iP6XrDmt8z69JTTcqdLuMhPij4tNYCQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-_U4OqLHFMCKExeNU2YfJAw-1; Wed, 10 Jun 2020 09:04:04 -0400
X-MC-Unique: _U4OqLHFMCKExeNU2YfJAw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97839107ACF3;
 Wed, 10 Jun 2020 13:04:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F5C060C87;
 Wed, 10 Jun 2020 13:04:03 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 86AA41809543;
 Wed, 10 Jun 2020 13:04:03 +0000 (UTC)
Date: Wed, 10 Jun 2020 09:04:03 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <660069492.15476972.1591794243308.JavaMail.zimbra@redhat.com>
In-Reply-To: <3cdd6be2-c27a-e9dc-2559-c6577239a1bc@cn.fujitsu.com>
References: <828833321.15301509.1591700517554.JavaMail.zimbra@redhat.com>
 <1591767427-29383-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1904123764.15455071.1591784009893.JavaMail.zimbra@redhat.com>
 <787d0f86-269b-1e23-2631-2c420d6dd884@cn.fujitsu.com>
 <3cdd6be2-c27a-e9dc-2559-c6577239a1bc@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.25]
Thread-Topic: syscalls/ioctl_loop05: Use correct blockdev to get
 logical_block_size
Thread-Index: cakvlHKSfSSSxLkhTg6DlV/1VePVRg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/ioctl_loop05: Use correct blockdev to
 get logical_block_size
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

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gPj4KPiA+PiBXaGF0IEkgaGFkIGluIG1p
bmQgd2hlbiBJIHJlZmVycmVkIHRvIGRmIHdhcyBzb21ldGhpbmcgbGlrZToKPiA+PiDCoMKgIHN0
YXQoInRlc3QuaW1nIiwgJnN0YXRidWYpOwo+ID4+IMKgwqAgU0FGRV9NS05PRCgiYmxrZGV2Iiwg
U19JRkJMSyB8IFNfSVJXWFUsIHN0YXRidWYuc3RfZGV2KTsKPiA+PiDCoMKgIGJsb2NrX2RldmZk
ID0gU0FGRV9PUEVOKCJibGtkZXYiLCBPX1JEV1IpOwo+ID4+IFdoYXQgZG8geW91IHRoaW5rPwo+
ID4+Cj4gSXQgd29ya3Mgd2VsbCBvbiBleHQ0IG9yIHhmcyBmaWxlc3lzdGVtKHVzZXIgbWF5IG1v
dW50IHdhbnRlZCBmaWxlc3lzdGVtCj4gb24gdG1wZGlyKS4gQnV0IGlmIHdlIHVzZSBidHJmcywg
dGhpcwo+IEJMS1NTWkdFVCB3aWxsIGZhaWwgYmVjYXVzZSBtYWpvciBkZXYgbnVtZXIgaXMgMC4g
V2hlbiB3ZSBtZWV0IHRoaXMKPiBzaXR1YXRpb24sIHdlIGRvbid0IG5lZWQgdG8gY2FsbCB0aGlz
IGlvY3RsIGFuZCB3ZSBjYW4gZGlyZWN0bHkgdGVzdAo+IGJlY3Vhc2UgaXQgZG9lc24nIHQgaGF2
ZSBiYWNraW5nIGZpbGUgYmxvY2sgZGV2aWNlIGFsaWduIGxpbWl0Lgo+IFdoYXQgZG8geW91IHRo
aW4gYWJvdXQgaXQ/CgpUaGlzIEkgZGlkbid0IGV4cGVjdC4gSWYgaXQncyBub3QgcmVsaWFibGUg
dGhlbiBwZXJoYXBzIHlvdXIgbWV0aG9kCmluIHYxIHRoYXQgaW5jcmVtZW50YWxseSBpbmNyZWFz
ZXMgaXQgdW50aWwgaXQgd29ya3MgaXMgcGVyaGFwcyBtb3N0CnVuaXZlcnNhbCBhcHByb2FjaC4g
U29ycnkgZm9yIHRoZSBkZXRvdXIgdG8gZ2V0IHRoZXJlLgoKCi0tIApNYWlsaW5nIGxpc3QgaW5m
bzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
