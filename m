Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D511913B259
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jan 2020 19:50:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B6D03C2357
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jan 2020 19:50:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id D0E7C3C0B99
 for <ltp@lists.linux.it>; Tue, 14 Jan 2020 19:50:50 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id DEE3B600711
 for <ltp@lists.linux.it>; Tue, 14 Jan 2020 19:50:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579027848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DGNsKVi6Jeh9krazQIzPI0LM722kddKE8mgvokkntp0=;
 b=a8Ld7A8HFavR6fpBCw0m0shw3xcMsQkplxrSI73Ibia4GM/oZ8RH9S5Rd8I/w4WcrPZo30
 fTSrjXYMITuWpeq/zWk+voM0k5irnALiyCHh0NzrWWHkElo6cFzocfdLzw6NC7l+Gch1fV
 jF7IPkU+tQt5nJfjN0nzH1DMJKnbQ6U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-BcNVDbQVP_OjSOetYnmCOg-1; Tue, 14 Jan 2020 13:50:44 -0500
X-MC-Unique: BcNVDbQVP_OjSOetYnmCOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59383107ACC5;
 Tue, 14 Jan 2020 18:50:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D10A60C18;
 Tue, 14 Jan 2020 18:50:43 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3EECD18089C8;
 Tue, 14 Jan 2020 18:50:43 +0000 (UTC)
Date: Tue, 14 Jan 2020 13:50:43 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: CKI Project <cki-project@redhat.com>, Rachel Sibley <rasibley@redhat.com>
Message-ID: <278993309.1964298.1579027843196.JavaMail.zimbra@redhat.com>
In-Reply-To: <cki.63107281D5.F4HIWEIQDO@redhat.com>
References: <cki.63107281D5.F4HIWEIQDO@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.8]
Thread-Topic: =?utf-8?B?4p2MIEZBSUw6?= Test report for kernel
 5.4.12-rc1-fc79c22.cki (stable)
Thread-Index: XwdgyZrD3xwF6XqOIHtAkpUycQFloA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E4?=
 =?utf-8?q?=2E12-rc1-fc79c22=2Ecki_=28stable=29?=
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
Cc: Memory Management <mm-qe@redhat.com>, LTP Mailing List <ltp@lists.linux.it>,
 Linux Stable maillist <stable@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gICAgIHg4Nl82NDoKPiAgICAgIOKdjCBM
VFAKClRoaXMgbG9va3MgbGlrZSBmYWxzZSBwb3NpdGl2ZS4gVGVtcCBwYXRoIHRoYXQgYXBwZWFy
cyBpbiBkbWVzZwpjb250YWlucyAiQlVHIiBzdWJzdHJpbmcsIHdoaWNoIGlzIHByb2JhYmx5IHdo
YXQgdHJpZ2dlcmVkIHRoZSByZXBvcnQuCgpbIDQxOTkuMjk1MjAyXSB4ZnMgZmlsZXN5c3RlbSBi
ZWluZyBtb3VudGVkIGF0IC9tbnQvdGVzdGFyZWEvbHRwLXFXcU5ZWGRiTk0vNFQwQlVHL21udF9w
b2ludCBzdXBwb3J0cyB0aW1lc3RhbXBzIHVudGlsIDIwMzggKDB4N2ZmZmZmZmYpCgoKLS0gCk1h
aWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
