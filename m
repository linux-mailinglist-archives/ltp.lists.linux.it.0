Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C88D72F7
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Oct 2019 12:15:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0DBCA3C224D
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Oct 2019 12:15:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 2A29C3C1CB8
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 12:15:43 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 94DED600695
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 12:15:41 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DE2C13079B77;
 Tue, 15 Oct 2019 10:15:39 +0000 (UTC)
Received: from dhcp-3-207.nay.redhat.com (dhcp-3-207.nay.redhat.com
 [10.66.3.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A7475DA8C;
 Tue, 15 Oct 2019 10:15:38 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 15 Oct 2019 18:15:34 +0800
Message-Id: <20191015101534.17691-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Tue, 15 Oct 2019 10:15:39 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] include: undefine _LINUX_TYPES_H if including
 sys/capability.h
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SW4gc29tZSBvZiB0aGUgbGliY2FwLWRldmVsKDEuOTZ+Mi4xNikgdmVyc2lvbnMsIGl0IGRlZmlu
ZXMgdGhlIF9MSU5VWF9UWVBFU19ICm1hY3JvIHRvIG1ha2UgbHRwLWxpYiBjYW5uJ3QgaW5jbHVk
ZSBsaW51eC90eXBlcy5oIGVzc2VudGlhbGx5LgoKICAgICMgY2F0IC1uIC91c3IvaW5jbHVkZS9z
eXMvY2FwYWJpbGl0eS5oCiAgICAuLi4KICAgIDI1ICAvKgogICAgMjYgICAqIE1ha2Ugc3VyZSB3
ZSBjYW4gYmUgaW5jbHVkZWQgZnJvbSB1c2VybGFuZCBieSBwcmV2ZW50aW5nCiAgICAyNyAgICog
Y2FwYWJpbGl0eS5oIGZyb20gaW5jbHVkaW5nIG90aGVyIGtlcm5lbCBoZWFkZXJzCiAgICAyOCAg
ICovCiAgICAyOSAgI2RlZmluZSBfTElOVVhfVFlQRVNfSAoKVG8gZ2V0IHJpZCBvZiB0aGlzIGNv
bXBpbGluZyBlcnJvcnMgb24gcmhlbDYobGliY2FwLWRldmVsLTIuMTYpIHNlcmllcyBwbGF0Zm9y
bSwKaGVyZSB1bmRlZmluZSBfTElOVVhfVFlQRVNfSCBpZiBpbmNsdWRlZCB0aGF0IHN5cy9jYXBh
YmlsaXR5LmguCgogID09IEVycm9yIGxvZyA9PQogIEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi9p
bmNsdWRlL3RzdF9uZXRsaW5rLmg6MjYsCiAgICAgICAgICAgICAgICAgZnJvbSB0c3RfY3J5cHRv
LmM6MTM6CiAgL3Vzci9pbmNsdWRlL2xpbnV4L25ldGxpbmsuaDo0NTogZXJyb3I6IGV4cGVjdGVk
IHNwZWNpZmllci1xdWFsaWZpZXItbGlzdCBiZWZvcmUg4oCYX191MTbigJkKICAvdXNyL2luY2x1
ZGUvbGludXgvbmV0bGluay5oOjEzNTogZXJyb3I6IGV4cGVjdGVkIHNwZWNpZmllci1xdWFsaWZp
ZXItbGlzdCBiZWZvcmUg4oCYX191MTbigJkKICB0c3RfY3J5cHRvLmM6IEluIGZ1bmN0aW9uIOKA
mHRzdF9jcnlwdG9fcmVjdl9hY2vigJk6CiAgdHN0X2NyeXB0by5jOjQ2OiBlcnJvcjog4oCYc3Ry
dWN0IG5sbXNnaGRy4oCZIGhhcyBubyBtZW1iZXIgbmFtZWQg4oCYbmxtc2dfc2Vx4oCZCiAgdHN0
X2NyeXB0by5jOjQ3OiBlcnJvcjog4oCYc3RydWN0IG5sbXNnaGRy4oCZIGhhcyBubyBtZW1iZXIg
bmFtZWQg4oCYbmxtc2dfdHlwZeKAmQogIHRzdF9jcnlwdG8uYzo0NzogZXJyb3I6IOKAmHN0cnVj
dCBubG1zZ2hkcuKAmSBoYXMgbm8gbWVtYmVyIG5hbWVkIOKAmG5sbXNnX3NlceKAmQogIHRzdF9j
cnlwdG8uYzo1NTogZXJyb3I6IOKAmHN0cnVjdCBubG1zZ2hkcuKAmSBoYXMgbm8gbWVtYmVyIG5h
bWVkIOKAmG5sbXNnX3R5cGXigJkKICB0c3RfY3J5cHRvLmM6NTg6IGVycm9yOiDigJhzdHJ1Y3Qg
bmxtc2doZHLigJkgaGFzIG5vIG1lbWJlciBuYW1lZCDigJhubG1zZ190eXBl4oCZCiAgdHN0X2Ny
eXB0by5jOjU4OiBlcnJvcjog4oCYc3RydWN0IG5sbXNnaGRy4oCZIGhhcyBubyBtZW1iZXIgbmFt
ZWQg4oCYbmxtc2dfc2Vx4oCZCiAgdHN0X2NyeXB0by5jOiBJbiBmdW5jdGlvbiDigJh0c3RfY3J5
cHRvX2FkZF9hbGfigJk6CiAgLi4uCiAgbWFrZTogKioqIFt0c3RfY3J5cHRvLm9dIEVycm9yIDEK
ClJlcG9ydGVkLWJ5OiBQaW5nIEZhbmcgPHBpZmFuZ0ByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5
OiBMaSBXYW5nIDxsaXdhbmdAcmVkaGF0LmNvbT4KQ2M6IFBpbmcgRmFuZyA8cGlmYW5nQHJlZGhh
dC5jb20+CkNjOiBSaWNoYXJkIFBhbGV0aG9ycGUgPHJwYWxldGhvcnBlQHN1c2UuY29tPgotLS0K
IGluY2x1ZGUvbGFwaS9jYXBhYmlsaXR5LmggfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGFwaS9jYXBhYmlsaXR5LmggYi9pbmNsdWRl
L2xhcGkvY2FwYWJpbGl0eS5oCmluZGV4IGRhYzIzM2Q4NC4uM2MyZWU3OTM3IDEwMDY0NAotLS0g
YS9pbmNsdWRlL2xhcGkvY2FwYWJpbGl0eS5oCisrKyBiL2luY2x1ZGUvbGFwaS9jYXBhYmlsaXR5
LmgKQEAgLTEwLDYgKzEwLDcgQEAKIAogI2lmZGVmIEhBVkVfU1lTX0NBUEFCSUxJVFlfSAogIyBp
bmNsdWRlIDxzeXMvY2FwYWJpbGl0eS5oPgorIyB1bmRlZiBfTElOVVhfVFlQRVNfSAogI2VuZGlm
CiAKICNpZm5kZWYgQ0FQX05FVF9SQVcKLS0gCjIuMjAuMQoKCi0tIApNYWlsaW5nIGxpc3QgaW5m
bzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
