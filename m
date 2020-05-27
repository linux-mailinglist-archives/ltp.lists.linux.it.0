Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B661E3D0F
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 11:04:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 170AA3C324D
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 11:04:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 711DE3C2466
 for <ltp@lists.linux.it>; Wed, 27 May 2020 11:04:17 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id C2BB2100153C
 for <ltp@lists.linux.it>; Wed, 27 May 2020 11:04:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590570255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PWhXcswVq6SAO3U9vtU0hg0R0n96s3ZCpGEvC+OFn00=;
 b=N5dO4CDXaFuMBP4JL1Vzm1gaTWHH80BRsSKyFZFhwUbvrRK3w5VJ+yV/mt46lmDaR2hFGi
 DY726sk3W+Bqhmee8wqNYVxI6qh+8qSG+qcauBM6uO6Yue/YfnY8aCLZqj6mt+QEH1Agj2
 Htdv7j+NLbWE7P0B22vW5oAYIgVvhs8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-KbHjuJmyNMKwrV1WgWasww-1; Wed, 27 May 2020 05:04:13 -0400
X-MC-Unique: KbHjuJmyNMKwrV1WgWasww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8783D8005AA;
 Wed, 27 May 2020 09:04:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CAA15D9E5;
 Wed, 27 May 2020 09:04:12 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 744D418095FF;
 Wed, 27 May 2020 09:04:12 +0000 (UTC)
Date: Wed, 27 May 2020 05:04:12 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Stanislav Kholmanskikh <stanislav.kholmanskikh@oracle.com>
Message-ID: <1158333456.13771112.1590570252412.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200526113847.6837-1-stanislav.kholmanskikh@oracle.com>
References: <20200526113847.6837-1-stanislav.kholmanskikh@oracle.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.20]
Thread-Topic: acct02: fix the ac_version check on big endian platforms
Thread-Index: F5SA17qIim+vh9pxeMLqgYRR/8syHw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] acct02: fix the ac_version check on big endian
 platforms
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

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gSWYgd2UgYXJlIG9uIGEgYmlnIGVuZGlh
biBwbGF0Zm9ybSB3aGVyZSBjaGFyIGlzIHNpZ25lZCwKPiB0aGUgZm9sbG93aW5nIGNvbXBpbGF0
aW9uIGVycm9yIGlzIGVtaXR0ZWQ6Cj4gCj4gYWNjdDAyLmM6IEluIGZ1bmN0aW9uIOKAmHZlcmlm
eV9hY2N04oCZOgo+IGFjY3QwMi5jOjM4OjM3OiB3YXJuaW5nOiBjb21wYXJpc29uIGlzIGFsd2F5
cyB0cnVlIGR1ZSB0byBsaW1pdGVkIHJhbmdlIG9mCj4gZGF0YSB0eXBlIFstV3R5cGUtbGltaXRz
XQo+ICAjZGVmaW5lIEFDQ1RfTUVNQkVSX1YzKHgpICgoKHN0cnVjdCBhY2N0X3YzICopYWNjKS0+
eCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+IGFjY3QwMi5jOjE0
NDo2OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYQUNDVF9NRU1CRVJfVjPigJkKPiAg
IGlmIChBQ0NUX01FTUJFUl9WMyhhY192ZXJzaW9uKSAhPSAoMyB8IEFDQ1RfQllURU9SREVSKSkg
ewo+IAo+IGFuZCB0aGUgdGVzdCBjYXNlIGZhaWxzLCBiZWNhdXNlIGl0IGNhbm5vdCAnZGVjcnlw
dCcgdGhlIGFjX3ZlcnNpb24KPiBmcm9tIHRoZSBmaWxlOgo+IAo+IGFjY3QwMi5jOjIzODogSU5G
TzogVmVyaWZ5aW5nIHVzaW5nICdzdHJ1Y3QgYWNjdF92MycKPiBhY2N0MDIuYzoxOTE6IElORk86
ID09IGVudHJ5IDEgPT0KPiBhY2N0MDIuYzoxNDY6IElORk86IGFjX3ZlcnNpb24gIT0gMyAoLTEy
NSkKPiAKPiBPbmUgd2F5IHRvIGFkZHJlc3MgdGhhdCBpcyB0byBleHBsaWNpdGx5IGNhc3QgdGhl
IGV4cHJlc3Npb24KPiB3ZSBjb21wYXJlIHRvICh3aGljaCBpcyBpbnQpIHRvIHRoZSB0eXBlIG9m
IGFjX3ZlcnNpb24gKHdoaWNoIGlzIGNoYXIpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFN0YW5pc2xh
diBLaG9sbWFuc2tpa2ggPHN0YW5pc2xhdi5raG9sbWFuc2tpa2hAb3JhY2xlLmNvbT4KCkFja2Vk
LWJ5OiBKYW4gU3RhbmNlayA8anN0YW5jZWtAcmVkaGF0LmNvbT4KCgotLSAKTWFpbGluZyBsaXN0
IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
