Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D392F1E1DB6
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 10:58:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 62D633C3270
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 10:58:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 093923C02C2
 for <ltp@lists.linux.it>; Tue, 26 May 2020 10:58:37 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 4E1B3200C3A
 for <ltp@lists.linux.it>; Tue, 26 May 2020 10:58:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590483514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dx/zhkiaaduWc6zhzssHNUgNrfCDX74k33D+DtPZHRg=;
 b=c3rJKBOp5yGDWYnj44d2ubc+VzvWahM3/7c4qbqLxQGzp429lX50cnJg7Zy8zdftNPnGbn
 fg7N+hJtttWwPLn2+dsGJAQ1MJWZD3iUS/PLkdwNWq9A//41w8rqNnjWwqd0QysWMPJyfs
 B+/3XRZi/Ct0KR+T87KnExWyaL3VTtw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-4C-VqTPnNd6soQ6zyCtjmQ-1; Tue, 26 May 2020 04:58:33 -0400
X-MC-Unique: 4C-VqTPnNd6soQ6zyCtjmQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EBCA1005510
 for <ltp@lists.linux.it>; Tue, 26 May 2020 08:58:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2732619D7F
 for <ltp@lists.linux.it>; Tue, 26 May 2020 08:58:32 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 205111809541;
 Tue, 26 May 2020 08:58:32 +0000 (UTC)
Date: Tue, 26 May 2020 04:58:31 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <2000957070.13598874.1590483511876.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200526070901.12957-1-liwang@redhat.com>
References: <20200526070901.12957-1-liwang@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.25]
Thread-Topic: use TCONF if hpage reserve failed in retry
Thread-Index: tlzEE0yv6f6TRXxVBBQ+QUJ2eEKUqw==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib: use TCONF if hpage reserve failed in retry
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

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gVGVzdCBzdGlsbCBlYXN5IHRvIGdldCBm
YWlsIGluwqBocGFnZXPCoHJlc2VydmluZyAob25seSA4MCUgb2YKPiBtYXhfaHBhZ2VzKSBiZWNh
dXNlIG9mIG1lbW9yeSBmcmFnbWVudGF0aW9uLgo+ICDCoAo+ICAgdHN0X2h1Z2VwYWdlLmM6NDY6
IEJST0s6IG5yX2h1Z2VwYWdlcyA9IDE3MSwgYnV0IGV4cGVjdCAyNTUKPiDCoCDCoAo+IEJ1dCBp
dCBzZWVtcyB1bmtpbmQgYW5kIHVzZWxlc3MgdG8gZXhpdCB3aXRoIFRCUk9LIHdoZW4gZmFpbGVk
Cj4gaW4gaHBhZ2UgcmVzZXJ2ZSByZXRyeWluZy4gVGhpcyBwYXRjaCBwcm9wb3NlcyB0byB1c2Ug
VENPTkYgZm9yCj4gYmV0dGVyIGxvZyByZXZpZXcuCj4gCj4gU2lnbmVkLW9mZi1ieTogTGkgV2Fu
ZyA8bGl3YW5nQHJlZGhhdC5jb20+Cj4gQ2M6IEphbiBTdGFuY2VrIDxqc3RhbmNla0ByZWRoYXQu
Y29tPgoKQWNrZWQtYnk6IEphbiBTdGFuY2VrIDxqc3RhbmNla0ByZWRoYXQuY29tPgoKCi0tIApN
YWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
