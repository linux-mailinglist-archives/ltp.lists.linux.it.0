Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 093EB275504
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 12:02:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BEBF83C5777
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 12:02:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 433FB3C078F
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 12:02:32 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id AAE7E200772
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 12:02:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600855350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0pX5iSzjzVMacHNMNmv2e8pnK4TUag/RbfFLsmOU7Ow=;
 b=f9eFITs7vH9PQmsj4ZEficfMPkPkqBop7g9zJPQmbMnjoCt5lxwWiRu0F5g+d0s+Nhz8gz
 StCOmzDAkeXIUHtCcUPJuMejgbR6qpmz0P0GNRvj+hVRfVY2eUYSp4R3NdH1QA43Dqtz6a
 iGCzdDz9kw0HSmx8pus/WGofQyA+qnQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-DbVH2jsFNYOoOouJog2VLQ-1; Wed, 23 Sep 2020 06:02:28 -0400
X-MC-Unique: DbVH2jsFNYOoOouJog2VLQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68B5F8030D2;
 Wed, 23 Sep 2020 10:02:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3663473682;
 Wed, 23 Sep 2020 10:02:27 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id F3AF68C7A1;
 Wed, 23 Sep 2020 10:02:26 +0000 (UTC)
Date: Wed, 23 Sep 2020 06:02:26 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <938084292.15015367.1600855346871.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200923084422.13101-1-yangx.jy@cn.fujitsu.com>
References: <20200923084422.13101-1-yangx.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.208.2, 10.4.195.1]
Thread-Topic: syscalls/recvmmsg01.c: Fix a compiler error
Thread-Index: DP+JRSpHeCsRqY+IkMlh0qcI2ZIoYw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/recvmmsg01.c: Fix a compiler error
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

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gVXNlIGNvcnJlY3QgdHMudHlwZSB0byBm
aXggdGhlIGZvbGxvd2luZyBjb21waWxlciBlcnJvcjoKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IHJlY3ZtbXNnMDEuYzo4Njo5OiBlcnJvcjogcmVxdWVz
dCBmb3IgbWVtYmVyIOKAmHR5cGXigJkgaW4gc29tZXRoaW5nIG5vdCBhCj4gc3RydWN0dXJlIG9y
IHVuaW9uCj4gICB0aW1lb3V0LnR5cGUgPSB0di0+dHNfdHlwZTsKPiAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IAo+IEZpeGVzOiAxMzVhZjhlZGVkZDQgKCJz
eXNjYWxscy97c2VuZHxyZWN2fW1tc2c6IGFkZCBhIHRlc3QgY2FzZSBmb3IgdGltZW91dAo+IGFu
ZCBlcnJubyB0ZXN0IikKPiBTaWduZWQtb2ZmLWJ5OiBYaWFvIFlhbmcgPHlhbmd4Lmp5QGNuLmZ1
aml0c3UuY29tPgoKQWNrZWQtYnk6IEphbiBTdGFuY2VrIDxqc3RhbmNla0ByZWRoYXQuY29tPgoK
Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK
