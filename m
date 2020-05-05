Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 090421C55ED
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 14:50:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C36C53C57ED
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 14:50:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id AE3023C28CE
 for <ltp@lists.linux.it>; Tue,  5 May 2020 14:50:31 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id DC2F81000B32
 for <ltp@lists.linux.it>; Tue,  5 May 2020 14:50:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588683029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Tjuxkce+p0qVk/9Xd717qE05lOz6BorloGtBrsU34GI=;
 b=HFs98jB7CMXNtTEK7C3H8A583uZFwmvLBKHqj+uDUZqZsClIoqRmuTVByzdmBmQoyfhXdA
 9W3NTy8VWcDukd0oD5HEA/Zc+SMJdSTEzX3fY+07PS9i1bR3ykXHpRkdMfsnJeUWvM2EOg
 CFJ3ZCCyuSxXM627xHT3eNfRZD5ce9Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-C4ojtA9pMdOdD27b2ZWDiw-1; Tue, 05 May 2020 08:50:27 -0400
X-MC-Unique: C4ojtA9pMdOdD27b2ZWDiw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37D8B461
 for <ltp@lists.linux.it>; Tue,  5 May 2020 12:50:26 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.43.17.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD96862482
 for <ltp@lists.linux.it>; Tue,  5 May 2020 12:50:25 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Tue,  5 May 2020 14:50:19 +0200
Message-Id: <135538f22cc17bd92eeff77a21a8bb8dbf926c4a.1588683000.git.jstancek@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH COMMITTED] syscalls/lremovexattr01: use strncmp() to
 check attribute value
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Rml4IHRoZSB0ZXN0IGZhaWx1cmUgYW5kIGZvbGxvd2luZyBjb21waWxlIHdhcm5pbmcgKGdjYyB2
ZXJzaW9uIDEwLjAuMSk6CiAgbHJlbW92ZXhhdHRyMDEuYzogSW4gZnVuY3Rpb24g4oCYdmVyaWZ5
X2xyZW1vdmV4YXR0cuKAmToKICBscmVtb3ZleGF0dHIwMS5jOjk4OjY6IHdhcm5pbmc6IOKAmHN0
cmNtcOKAmSBvZiBhIHN0cmluZyBvZiBsZW5ndGggMTMgYW5kIGFuIGFycmF5IG9mIHNpemUgMTMg
ZXZhbHVhdGVzIHRvIG5vbnplcm8gWy1Xc3RyaW5nLWNvbXBhcmVdCiAgICAgOTggfCAgaWYgKHN0
cmNtcChnb3RfdmFsdWUsIFhBVFRSX1ZBTFVFKSkgewogICAgICAgIHwgICAgICBefn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn4KClNpZ25lZC1vZmYtYnk6IEphbiBTdGFuY2VrIDxqc3RhbmNl
a0ByZWRoYXQuY29tPgotLS0KIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvbHJlbW92ZXhhdHRy
L2xyZW1vdmV4YXR0cjAxLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2xy
ZW1vdmV4YXR0ci9scmVtb3ZleGF0dHIwMS5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9s
cmVtb3ZleGF0dHIvbHJlbW92ZXhhdHRyMDEuYwppbmRleCAwYzE5YzYyYWNlNTAuLjU5MGY1YTZm
MzJhMCAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9scmVtb3ZleGF0dHIv
bHJlbW92ZXhhdHRyMDEuYworKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2xyZW1vdmV4
YXR0ci9scmVtb3ZleGF0dHIwMS5jCkBAIC05NSw3ICs5NSw3IEBAIHN0YXRpYyB2b2lkIHZlcmlm
eV9scmVtb3ZleGF0dHIodm9pZCkKIAkJcmV0dXJuOwogCX0KIAotCWlmIChzdHJjbXAoZ290X3Zh
bHVlLCBYQVRUUl9WQUxVRSkpIHsKKwlpZiAoc3RybmNtcChnb3RfdmFsdWUsIFhBVFRSX1ZBTFVF
LCBYQVRUUl9WQUxVRV9TSVpFKSkgewogCQl0c3RfcmVzKFRGQUlMLCAibHJlbW92ZXhhdHRyKDIp
IGNoYW5nZWQgZmlsZSBhdHRyaWJ1dGUiKTsKIAkJcmV0dXJuOwogCX0KLS0gCjIuMTguMQoKCi0t
IApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
