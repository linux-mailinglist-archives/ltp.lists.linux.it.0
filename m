Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD46A3B1473
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 09:16:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ADAC13C7027
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 09:16:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4402E3C202C
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 09:15:58 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8761E60004A
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 09:15:57 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id A68E79F7F3;
 Wed, 23 Jun 2021 07:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1624432551; bh=H0PqCJtIUXQ1Dq3+7F+fnaGQJzJqQ0RB4+g59iK4cWA=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=EoX8ntK6XV4uvyAV+8h9f1ORBq20ifijLqEJvjchOp41AK0byrVA44vthVVpI4kEm
 1BzXqAJRKMy4yoeu312eId4iNthVEaq0yImq1gUOmzKqHxaUCD4LvxVvTGrL+QopCa
 8fr3iyIKNIEU3S6xm/if+b4tRn3qsDkj5mdPr4uw=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	rpalethorpe@suse.com
Date: Wed, 23 Jun 2021 09:15:39 +0200
Message-Id: <20210623071543.171021-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 0/3] cpuset_regression_test: convert and improve
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

SGksCgp0aGlzIGlzIG1vcmUgb3IgbGVzcyBhIHYyIG9mIGEgcGF0Y2ggSSBzZW5kIHByZXZpb3Vz
bHkgKHBhdGNoIDMpLgpJIGtub3cgdGhhdCByaWNoYXJkIGlzIG5vdCBlbnRpcmVseSBoYXBweSB3
aXRoIHRoaXMgcGF0Y2gsIEkgd2lsbApnaXZlIGl0IGFub3RoZXIgdHJ5IGFueXdheS4uLgpJdCBp
cyBlaXRoZXIgdGhpcyBwYXRjaCBvciBhbm90aGVyIHBhdGNoLCB0aGF0IGhhcyB0byBsb29rIHRo
cm91Z2gKdGhlIGNncm91cCBoaWVyYXJjaHksIHRvIGNoZWNrIGlmIHRoZXJlIGlzIGFueSBncm91
cCx0aGF0IGV4cGxpY2l0ZWx5CnVzZXMgY3B1IDAuIAoKVG8gbWUsIGl0IGlzIGEgYmV0dGVyIHNv
bHV0aW9uIHRvIGp1c3QgY2hhbmdlIGdyb3VwcyBmb3IgYSBzaG9ydCB0aW1lLAphbmQgY2hlY2sg
aWYgdGhlIGJ1ZyBleGlzdHMuIElmIGx0cCB0ZXN0cyBhcmUgcnVubmluZywgdGhlIGNoYW5jZSwg
dGhhdAp0aGVyZSBpcyBhbnl0aGluZyBydW5uaW5nLCB0aGF0IHJlYWxseSBuZWVkcyBhIGNvcnJl
Y3QgY3B1c2V0IGlzIHZlcnkgbG93LgpJIGFtIGNvbW1pbmcgZnJvbSBhIHN5c3RlbSwgd2hlcmUg
Y2dyb3VwcyBhcmUgc2V0dXAgYnkgYSBjb250YWluZXIgbGF1bmNoZXIsCnRoYXQganVzdCBoYXBw
ZW5zIHRvIGFzc2lnbiBjcHVzIHRvIHRoZSBjb250YWluZXJzIC0gbm90IGV2ZW4gZXhjbHVzaXZl
bHkuCkxUUCB0ZXN0cyBhcmUgdXNlZCBhcyBzb21lIHBhcnQgb2YgdGhlIHRlc3RzdWl0ZSwgdG8g
dGVzdCBhcyBjbG9zZSB0byBhCnByb2R1Y3Rpb24gc3lzdGVtIGFzIHBvc3NpYmxlLgoKVGhlIG9u
bHkgd2F5IEkgY291bGQgdGhpbmsgb2YgYSBwcm9jZXNzIG1pc2JlaGF2aW5nIGJ5IGRpc2FiZWxp
bmcgY3B1IHBpbm5pbmcsCndvdWxkIGJlIGEgYmFkbHkgd3JpdHRlbiBtdWx0aXRocmVhZCBhcHBs
aWNhdGlvbiwgdGhhdCBjYW5ub3QgY29ycmVjdGx5IHJ1biwKaWYgdGhyZWFkcyBhcmUgcmVhbGx5
IHJ1bm5pbmcgaW4gcGFyYWxsZWwsIGJ1dCB0aGlzIHdvdWxkIGFsc28gcmVxdWlyZSBhIHNjaGVk
dWxpbmcKcG9saWN5LCB0aGF0IG1ha2VzIHNjaGVkdWxpbmcgcG9pbnRzIHByZWRpY2F0YWJsZS4g
V2hpbGUgSSBrbm93IHRoYXQgc29mdHdhcmUgbGlrZQp0aGF0IGV4aXN0cyAoaW4gZmFjdCBJIHdh
cyB3b3JraW5nIG9uIHNvbWV0aGluZyBsaWtlIHRoYXQgaW4gdGhlIHBhc3QpLCBJIHRoaW5rIGl0
CmlzIGhpZ2hseSB1bmxpa2VseSwgdGhhdCBpdCBpcyBydW5uaW5nIHBhcmFsbGVsIHRvIGx0cC4K
QW5kIGV2ZW4gdGhlbiwgdGhpcyBjb3VsZCBiZSBtaXRpZ2F0ZWQgYnkgbm90IGp1c3Qgc2V0dGlu
ZyBjcHUgYmluZGluZyB0byB1bmRlZmluZWQsCmJ1dCB0byBvbmUgZml4ZWQgY29yZS4gQnV0IHdp
dGggdGhlIGNoYW5nZXMgaW4gcGF0Y2ggMiwgdGhpcyBpcyBub3QgcG9zc2libGUuCgpCdXQgYW55
aG93IGx0cCBmaWRkbGVzIHdpdGggbG90cyBvZiBjcml0aWNhbCBzeXN0ZW0gcGFyYW1ldGVycyBk
dXJpbmcgaXQncyBydW50aW1lLAp0aGVyZSBpcyBubyBndWFyYW50ZWUsIHRoYXQgYW4gYXBwbGlj
YXRpb24gdGhhdCByZXF1aXJlcyBzb21lIHZlcnkgc3BlY2lmaWMga2VybmVsCnJ1bnRpbWUgc2V0
dGluZ3Mgc3Vydml2ZXMgdGhpcy4gVGhhdCdzIHdoeSBJIHdvdWxkIHN0aWxsIHZvdGUgZm9yIHRo
aXMgcGF0Y2guCgpKw7ZyZwoKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMu
bGludXguaXQvbGlzdGluZm8vbHRwCg==
