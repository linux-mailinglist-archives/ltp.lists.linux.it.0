Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DE346E19
	for <lists+linux-ltp@lfdr.de>; Sat, 15 Jun 2019 06:21:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 39FC32988E7
	for <lists+linux-ltp@lfdr.de>; Sat, 15 Jun 2019 06:21:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id F3F0E294B33
 for <ltp@lists.linux.it>; Sat, 15 Jun 2019 06:21:05 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C04701A01CAB
 for <ltp@lists.linux.it>; Sat, 15 Jun 2019 06:20:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 82BD43082B71
 for <ltp@lists.linux.it>; Sat, 15 Jun 2019 04:20:56 +0000 (UTC)
Received: from dhcp-12-157.nay.redhat.com (dhcp-12-157.nay.redhat.com
 [10.66.12.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B01985D9E2
 for <ltp@lists.linux.it>; Sat, 15 Jun 2019 04:20:55 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Sat, 15 Jun 2019 12:20:48 +0800
Message-Id: <20190615042048.29839-3-liwang@redhat.com>
In-Reply-To: <20190615042048.29839-1-liwang@redhat.com>
References: <20190615042048.29839-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Sat, 15 Jun 2019 04:20:56 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 3/3] testcase: get rid of compiling errors
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

U2lnbmVkLW9mZi1ieTogTGkgV2FuZyA8bGl3YW5nQHJlZGhhdC5jb20+Ci0tLQogY29uZmlndXJl
LmFjICAgICAgICAgICAgIHwgMSArCiB0ZXN0Y2FzZXMvY3ZlL21lbHRkb3duLmMgfCA1ICsrKysr
CiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2NvbmZpZ3Vy
ZS5hYyBiL2NvbmZpZ3VyZS5hYwppbmRleCA1ZWNjOTI3ODEuLjUyMWY1NjU0MSAxMDA2NDQKLS0t
IGEvY29uZmlndXJlLmFjCisrKyBiL2NvbmZpZ3VyZS5hYwpAQCAtNTgsNiArNTgsNyBAQCBBQ19D
SEVDS19IRUFERVJTKFsgXAogICAgIHN5cy9zaG0uaCBcCiAgICAgc3lzL3VzdGF0LmggXAogICAg
IHN5cy94YXR0ci5oIFwKKyAgICBlbW1pbnRyaW4uaCBcCiBdKQogCiBBQ19DSEVDS19GVU5DUyhb
IFwKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9jdmUvbWVsdGRvd24uYyBiL3Rlc3RjYXNlcy9jdmUv
bWVsdGRvd24uYwppbmRleCA3MmM5ZWM5MDcuLmJjNjQ5Yjg5MyAxMDA2NDQKLS0tIGEvdGVzdGNh
c2VzL2N2ZS9tZWx0ZG93bi5jCisrKyBiL3Rlc3RjYXNlcy9jdmUvbWVsdGRvd24uYwpAQCAtMjks
NiArMjksNyBAQAogI2luY2x1ZGUgPGN0eXBlLmg+CiAjaW5jbHVkZSA8c3lzL3V0c25hbWUuaD4K
IAorI2lmZGVmIEhBVkVfRU1NSU5UUklOX0gKICNpbmNsdWRlIDxlbW1pbnRyaW4uaD4KIAogI2lu
Y2x1ZGUgImxpYnRzYy5oIgpAQCAtMzg3LDMgKzM4OCw3IEBAIHN0YXRpYyBzdHJ1Y3QgdHN0X3Rl
c3QgdGVzdCA9IHsKIAkuY2xlYW51cCA9IGNsZWFudXAsCiAJLm1pbl9rdmVyID0gIjIuNi4zMiIK
IH07CisKKyNlbHNlIC8qIEhBVkVfRU1NSU5UUklOX0ggKi8KKwlUU1RfVEVTVF9UQ09ORigiPGVt
bWludHJpbi5oPiBpcyBub3Qgc3VwcG9ydGVkIik7CisjZW5kaWYKLS0gCjIuMjAuMQoKCi0tIApN
YWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
