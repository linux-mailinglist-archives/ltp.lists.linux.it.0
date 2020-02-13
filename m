Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F4D15BAD7
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Feb 2020 09:36:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EFF823C24B2
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Feb 2020 09:36:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 797CB3C144F
 for <ltp@lists.linux.it>; Thu, 13 Feb 2020 09:36:00 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 492212013B9
 for <ltp@lists.linux.it>; Thu, 13 Feb 2020 09:35:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581582957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i2TyaWWzBM+Rqkj6hIZ0HII4rfiYjy4mo0lD8wT/v74=;
 b=T5mfIAGgnYDkaWaxju6MtBfyByVrZvgtMgoUFK39ZKW0UI20EkvSfGHWyhreKcm3uoN7+0
 2acGoSgbF7Gw+rS0wq3Juv8CYaQizl75YuSRyU6eKJYSHiDRZgbttyjmfAmF+T3d9Hvg1A
 xNoYk6JSO2x7qnbPDyxnOWDaySFAYac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-Vw1-ybSfOE62_M7A1a-OCg-1; Thu, 13 Feb 2020 03:35:55 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5383D13F8;
 Thu, 13 Feb 2020 08:35:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7E581001B28;
 Thu, 13 Feb 2020 08:35:53 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4FAC48B2AA;
 Thu, 13 Feb 2020 08:35:53 +0000 (UTC)
Date: Thu, 13 Feb 2020 03:35:53 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <702486188.7490041.1581582953077.JavaMail.zimbra@redhat.com>
In-Reply-To: <71c807c2-b77b-5081-76f8-335aaf1cbe3a@cn.fujitsu.com>
References: <1581486286-13615-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1892366945.7197852.1581514327491.JavaMail.zimbra@redhat.com>
 <71c807c2-b77b-5081-76f8-335aaf1cbe3a@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.5]
Thread-Topic: syscalls/kill11: add a check between hard limit and
 MIN_RLIMIT_CORE
Thread-Index: 01vF8oxyqKdWBYyJBicjCYKfufihDQ==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: Vw1-ybSfOE62_M7A1a-OCg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/kill11: add a check between hard limit
 and MIN_RLIMIT_CORE
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

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gPiBUaGlzIGxvb2tzIE9LLCBidXQgY291
bGQgd2UgYWxzbyByYWlzZSB0aGUgbGltaXQgd2hlbiBwb3NzaWJsZT8KPiA+IAo+IE9mIGNvdXJz
ZS4gWW91ciB3YXkgaXMgbW9yZSB3aXNlLgo+IEJ1dCBJIGFsc28gd2FudCB0byBjaGFuZ2UgdGhp
cyBzaXplIG9mIE1JTl9STElNSVRfQ09SRS4KPiAgRnJvbSB1bGltaXQgbWFucGFnZSwgSSBrbm93
IGluIHBvc2l4IG1vZGUgIi1jIiB1c2VkIDUxMi1ieXRlIGJsb2NrLiBJCj4gZG91YnQgd2hldGhl
ciB3ZSBjYW4gY2hhbmdlIE1JTl9STElNSVRfQ09SRSg1MTIgKjEwMjQpLCBzbyB0aGlzIGNhc2UK
PiBjYW4gYWxzbyBwYXNzIGluIHVuYnVudHUoZGVmYXVsdCBlbnZpcm9ubWVudCkuCj4gV2hhdCBk
byB5b3UgdGhpbmsgYWJvdXQgdGhpc++8nwoKSSBkb24ndCBzZWUgcHJvYmxlbSB3aXRoIHRoYXQs
IHdlIG9ubHkgY2hlY2sgZm9yIGNvcnJlY3Qgc2lnbmFsLgpUaG91Z2ggaXQgcHJvYmFibHkgc2hv
dWxkIGJlIHNlcGFyYXRlIHBhdGNoLiBDYW4geW91IHJlLXBvc3QKYm90aCBhcyAyIHBhdGNoIHNl
cmllcz8KCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlz
dGluZm8vbHRwCg==
