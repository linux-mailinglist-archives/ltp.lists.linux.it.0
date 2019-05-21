Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CA01525094
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 15:38:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 94AEB294AE3
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 15:38:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id F032A3EA690
 for <ltp@lists.linux.it>; Tue, 21 May 2019 15:38:18 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8BFDD600803
 for <ltp@lists.linux.it>; Tue, 21 May 2019 15:38:20 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A484319DD1;
 Tue, 21 May 2019 13:38:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 99E74600C6;
 Tue, 21 May 2019 13:38:16 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8DEB65B423;
 Tue, 21 May 2019 13:38:16 +0000 (UTC)
Date: Tue, 21 May 2019 09:38:13 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <911848816.23841590.1558445893494.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190521132936.GA19326@rei.lan>
References: <dc7300409a949189aa4ce9ef555405e36bdb50ab.1558426636.git.jstancek@redhat.com>
 <20190521132936.GA19326@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.13]
Thread-Topic: overcommit_memory: update for "mm: fix false-positive
 OVERCOMMIT_GUESS failures"
Thread-Index: cZgJhYkcnnNrs55kK5jV6Pa+pyNO2g==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 21 May 2019 13:38:16 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: liwan@redhat.com, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] overcommit_memory: update for "mm: fix
 false-positive OVERCOMMIT_GUESS failures"
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

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gSGkhCj4gPiBjb21taXQgOGM3ODI5YjA0
YzUyICgibW06IGZpeCBmYWxzZS1wb3NpdGl2ZSBPVkVSQ09NTUlUX0dVRVNTIGZhaWx1cmVzIikK
PiA+IGNoYW5nZXMgbG9naWMgb2YgX192bV9lbm91Z2hfbWVtb3J5KCksIHNpbXBsaWZ5aW5nIGl0
IHRvOgo+ID4gICAgIFdoZW4gaW4gR1VFU1MgbW9kZSwgY2F0Y2ggd2lsZCBhbGxvY2F0aW9ucyBi
eSBjb21wYXJpbmcgdGhlaXIgcmVxdWVzdAo+ID4gICAgIHNpemUgdG8gdG90YWwgYW1vdW50IG9m
IHJhbSBhbmQgc3dhcCBpbiB0aGUgc3lzdGVtLgo+ID4gCj4gPiBUZXN0Y2FzZSBjdXJyZW50bHkg
YWxsb2NhdGVzIG1lbV90b3RhbCArIHN3YXBfdG90YWwsIHdoaWNoIGRvZXNuJ3QgdHJpZ2dlcgo+
ID4gbmV3IGNvbmRpdGlvbi4gTWFrZSBpdCBtb3JlIGV4dHJlbWUsIGJ1dCBhc3N1bWluZyBmcmVl
X3RvdGFsIC8gMiB3aWxsIFBBU1MsCj4gPiBhbmQgc3VtX3RvdGFsICogMiB3aWxsIEZBSUwuCj4g
Cj4gTG9va3MgZ29vZCwgYWNrZWQuCgpQdXNoZWQuCgo+IAo+IC0tCj4gQ3lyaWwgSHJ1YmlzCj4g
Y2hydWJpc0BzdXNlLmN6Cj4gCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMu
bGludXguaXQvbGlzdGluZm8vbHRwCg==
