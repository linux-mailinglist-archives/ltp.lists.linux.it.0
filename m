Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6B922967
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 01:33:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4DF5E3EA6F4
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 01:33:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 9DEA93EA63C
 for <ltp@lists.linux.it>; Mon, 20 May 2019 01:33:36 +0200 (CEST)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0A1B11A00651
 for <ltp@lists.linux.it>; Mon, 20 May 2019 01:33:35 +0200 (CEST)
Received: by mail-pf1-x441.google.com with SMTP id u17so6277104pfn.7
 for <ltp@lists.linux.it>; Sun, 19 May 2019 16:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+GwJlHeKbNL36/Kk/WfJGOOk90S2f95IUwUpudKTIAI=;
 b=HukU1egislQg2AZHIrvdYmPYTr14oIXbqteTbjnDiISMmEU6Sz/296AuNKo88FVUnk
 f+dQGWpcnlHeYCQd5dDNAaA02Wa714CJt/JLJzHYHCJVMufHSqF5qtra+tPpyfJRcF+y
 4oyFY6+vQfFfL3dSDBGA/k0+p/L9+qtU7KaDU4irkcBd2Eus9G9cFaK7aJKNKi7uMK9v
 Ubc+TEbDfTwxhY7xCaslqDiqREEKyE4wURUkNkjvl3/HMtEQV1mLjS/dNw01ejIOcu2Q
 DkAYau+p7AHF4qP+I6NDkxsbHfVfftxtVIWRtVBucw9cK0lk7ulV89sE+jsYr1Dk973P
 koNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+GwJlHeKbNL36/Kk/WfJGOOk90S2f95IUwUpudKTIAI=;
 b=uTKiOtd5AqZqqM9Ar+kL3HPsX+0f+lXWKuXGivhEjdtfT3kBp5JS+ImlM/K9jwPGwA
 shxs3ic2KTnApE4ekX3QUhOsMQbF8ZkHa56/lXbrLigWPoAXILT9OXOWAH4wafGzxsLi
 mlv0dTQ9xVmpWWdrzsMioJzqvmwTKQBKsBzlOcDIaQaJJgszRrstz4+pEMQMZr2zYi+c
 s+toJbkgecWv+g1JXabeZKu7/o7lwllfftmKwjQWVFNGR7VeRoTOdR3aB4IlXw/Q7X3V
 OfpJxq21+NKKkeQGOScT6KY+4LvgmqMSJ0Ahb4HQNSvLztgPLSGkN5fcyWcm4DTcvS/t
 CulA==
X-Gm-Message-State: APjAAAVui2i/Xb7j1MeSCZIp0QhuMAKA8W5Ohi9C42a+AfgQLzpcdyRM
 Ub8t+RfE8ZjopGpqG9tFi3/AEoAZsThkOg==
X-Google-Smtp-Source: APXvYqx9FRQrJiwboguMuISkDKywBvXinL6szIy6IqE/es2oAXGpwhR95MtL263/ADH33ZrA+S3TXw==
X-Received: by 2002:a63:d70b:: with SMTP id d11mr69645136pgg.178.1558308813072; 
 Sun, 19 May 2019 16:33:33 -0700 (PDT)
Received: from sspatil-glaptop2.roam.corp.google.com ([61.58.47.46])
 by smtp.gmail.com with ESMTPSA id p2sm17700102pgd.63.2019.05.19.16.33.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 19 May 2019 16:33:32 -0700 (PDT)
From: Sandeep Patil <sspatil@android.com>
To: ltp@lists.linux.it
Date: Sun, 19 May 2019 16:33:27 -0700
Message-Id: <20190519233327.249118-1-sspatil@android.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190519003808.47425-5-sspatil@android.com>
References: <20190519003808.47425-5-sspatil@android.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: chrubis@suze.cz, kernel-team@android.com
Subject: [LTP] [PATCH v2] syscalls/bdflush01: delete bdflush test
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

VGhlIG1hbnVhbCBzYXlzIHRoZSBzeXN0ZW0gY2FsbCBpcyBkZXByZWNhdGVkIHNpbmNlIExpbnV4
IDIuNgphbmQgZG9lcyBub3RoaW5nLiBTbywgcmVtb3ZlIHRoZSB0ZXN0LgoKU2lnbmVkLW9mZi1i
eTogU2FuZGVlcCBQYXRpbCA8c3NwYXRpbEBhbmRyb2lkLmNvbT4KLS0tCnYyCj09PT09Ci0gRGVs
ZXRlIGJkZmx1c2gwMSBmcm9tIHJ1bnRlc3QKCiBydW50ZXN0L3N5c2NhbGxzICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDIgLQogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9iZGZs
dXNoLy5naXRpZ25vcmUgIHwgICAxIC0KIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvYmRmbHVz
aC9NYWtlZmlsZSAgICB8ICAyMyAtLS0tCiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2JkZmx1
c2gvYmRmbHVzaDAxLmMgfCAxMjYgLS0tLS0tLS0tLS0tLS0tLS0tCiA0IGZpbGVzIGNoYW5nZWQs
IDE1MiBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCB0ZXN0Y2FzZXMva2VybmVsL3N5
c2NhbGxzL2JkZmx1c2gvLmdpdGlnbm9yZQogZGVsZXRlIG1vZGUgMTAwNjQ0IHRlc3RjYXNlcy9r
ZXJuZWwvc3lzY2FsbHMvYmRmbHVzaC9NYWtlZmlsZQogZGVsZXRlIG1vZGUgMTAwNjQ0IHRlc3Rj
YXNlcy9rZXJuZWwvc3lzY2FsbHMvYmRmbHVzaC9iZGZsdXNoMDEuYwoKZGlmZiAtLWdpdCBhL3J1
bnRlc3Qvc3lzY2FsbHMgYi9ydW50ZXN0L3N5c2NhbGxzCmluZGV4IDJiOGNhNzE5Yi4uOTdiOTNi
MjRlIDEwMDY0NAotLS0gYS9ydW50ZXN0L3N5c2NhbGxzCisrKyBiL3J1bnRlc3Qvc3lzY2FsbHMK
QEAgLTMxLDggKzMxLDYgQEAgYmluZDAxIGJpbmQwMQogYmluZDAyIGJpbmQwMgogYmluZDAzIGJp
bmQwMwogCi1iZGZsdXNoMDEgYmRmbHVzaDAxCi0KIGJyazAxIGJyazAxCiAKIGNhcGdldDAxIGNh
cGdldDAxCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2JkZmx1c2gvLmdp
dGlnbm9yZSBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvYmRmbHVzaC8uZ2l0aWdub3JlCmRl
bGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA1NDYwMWVjMmQuLjAwMDAwMDAwMAotLS0gYS90
ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2JkZmx1c2gvLmdpdGlnbm9yZQorKysgL2Rldi9udWxs
CkBAIC0xICswLDAgQEAKLS9iZGZsdXNoMDEKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwv
c3lzY2FsbHMvYmRmbHVzaC9NYWtlZmlsZSBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvYmRm
bHVzaC9NYWtlZmlsZQpkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMmVmODZmMDZmLi4w
MDAwMDAwMDAKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9iZGZsdXNoL01ha2VmaWxl
CisrKyAvZGV2L251bGwKQEAgLTEsMjMgKzAsMCBAQAotIwotIyAgQ29weXJpZ2h0IChjKSBJbnRl
cm5hdGlvbmFsIEJ1c2luZXNzIE1hY2hpbmVzICBDb3JwLiwgMjAwOQotIwotIyAgVGhpcyBwcm9n
cmFtIGlzIGZyZWUgc29mdHdhcmU7ICB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9k
aWZ5Ci0jICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNl
bnNlIGFzIHB1Ymxpc2hlZCBieQotIyAgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0
aGVyIHZlcnNpb24gMiBvZiB0aGUgTGljZW5zZSwgb3IKLSMgIChhdCB5b3VyIG9wdGlvbikgYW55
IGxhdGVyIHZlcnNpb24uCi0jCi0jICBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhl
IGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKLSMgIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5U
WTsgIHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgotIyAgTUVSQ0hBTlRBQklM
SVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlCi0jICB0aGUgR05V
IEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KLSMKLSMgIFlvdSBzaG91
bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
Ci0jICBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgIGlmIG5vdCwgd3JpdGUgdG8gdGhlIEZyZWUg
U29mdHdhcmUKLSMgIEZvdW5kYXRpb24sIEluYy4sIDUxIEZyYW5rbGluIFN0LCBGaWZ0aCBGbG9v
ciwgQm9zdG9uLCBNQSAgMDIxMTAtMTMwMSAgVVNBCi0jCi0KLXRvcF9zcmNkaXIJCT89IC4uLy4u
Ly4uLy4uCi0KLWluY2x1ZGUgJCh0b3Bfc3JjZGlyKS9pbmNsdWRlL21rL3Rlc3RjYXNlcy5tawot
Ci1pbmNsdWRlICQodG9wX3NyY2RpcikvaW5jbHVkZS9tay9nZW5lcmljX2xlYWZfdGFyZ2V0Lm1r
CmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2JkZmx1c2gvYmRmbHVzaDAx
LmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2JkZmx1c2gvYmRmbHVzaDAxLmMKZGVsZXRl
ZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDEzMjNjYzRlNC4uMDAwMDAwMDAwCi0tLSBhL3Rlc3Rj
YXNlcy9rZXJuZWwvc3lzY2FsbHMvYmRmbHVzaC9iZGZsdXNoMDEuYworKysgL2Rldi9udWxsCkBA
IC0xLDEyNiArMCwwIEBACi0vKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqLwotLyogQ29weXJpZ2h0IChj
KSBDcmFja2VyamFjayBQcm9qZWN0LiwgMjAwNwkJCQkgICAqLwotLyoJCQkJCQkJCQkgICAgKi8K
LS8qIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyAgeW91IGNhbiByZWRpc3RyaWJ1dGUg
aXQgYW5kL29yIG1vZGlmeSAgICAgICovCi0vKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdO
VSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieSAgICAgICAqLwotLyogdGhl
IEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiBvZiB0aGUgTGljZW5z
ZSwgb3IJICAqLwotLyogKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4JCQkJCSov
Ci0vKgkJCQkJCQkJCSAgICAqLwotLyogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRo
ZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCSAgICAqLwotLyogYnV0IFdJVEhPVVQgQU5Z
IFdBUlJBTlRZOyAgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCSAgICAqLwot
LyogTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAg
U2VlCQkgICovCi0vKiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0
YWlscy4JCQkgICAqLwotLyoJCQkJCQkJCQkgICAgKi8KLS8qIFlvdSBzaG91bGQgaGF2ZSByZWNl
aXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCSAgKi8KLS8qIGFs
b25nIHdpdGggdGhpcyBwcm9ncmFtOyAgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2Fy
ZQkgICAgICAgKi8KLS8qIEZvdW5kYXRpb24sIEluYy4sIDUxIEZyYW5rbGluIFN0cmVldCwgRmlm
dGggRmxvb3IsIEJvc3RvbiwgTUEgMDIxMTAtMTMwMSBVU0EgICAgKi8KLS8qCQkJCQkJCQkJICAg
ICovCi0vKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqLwotLyoqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKi8KLS8q
CQkJCQkJCQkJICAgICovCi0vKiBGaWxlOgliZGZsdXNoMDEuYwkJCQkJICAgICovCi0vKgkJCQkJ
CQkJCSAgICAqLwotLyogRGVzY3JpcHRpb246IGJkZmx1c2goKSBzdGFydHMsIGZsdXNoZXMsIG9y
IHR1bmVzIHRoZSBidWZmZXItZGlydHktZmx1c2ggICAgKi8KLS8qCQlkYWVtb24uIE9ubHkgYSBw
cml2aWxlZ2VkIHByb2Nlc3MgKG9uZSB3aXRoIHRoZSBDQVBfU1lTX0FETUlOICovCi0vKgkJY2Fw
YWJpbGl0eSkgbWF5IGNhbGwgYmRmbHVzaCgpLgkJCQkgICAgICAqLwotLyoJCQkJCQkJCQkgICAg
ICAqLwotLyoJCUlmIGZ1bmMgaXMgbmVnYXRpdmUgb3IgMCwgYW5kIG5vIGRhZW1vbiBoYXMgYmVl
biBzdGFydGVkLCAgICAgKi8KLS8qCQl0aGVuIGJkZmx1c2goKSBlbnRlcnMgdGhlIGRhZW1vbiBj
b2RlIGFuZCBuZXZlciByZXR1cm5zLiAgICAgICovCi0vKgkJCQkJCQkJCSAgICAgICovCi0vKgkJ
SWYgZnVuYyBpcyAxLCBzb21lIGRpcnR5IGJ1ZmZlcnMgYXJlIHdyaXR0ZW4gdG8gZGlzay4JICAg
ICAgKi8KLS8qCQlJZiBmdW5jIGlzIDIgb3IgbW9yZSBhbmQgaXMgZXZlbiAobG93IGJpdCBpcyAw
KSwgdGhlbiBhZGRyZXNzICovCi0vKgkJaXMgdGhlIGFkZHJlc3Mgb2YgYSBsb25nIHdvcmQsIGFu
ZCB0aGUgdHVuaW5nIHBhcmFtZXRlciAgICAgICAqLwotLyoJCW51bWJlcmVkIChmdW5jLTIpLzIg
aXMgcmV0dXJuZWQgdG8gdGhlIGNhbGxlciBpbiB0aGF0IGFkZHJlc3MuKi8KLS8qCQkJCQkJCQkJ
ICAgICAgKi8KLS8qCQlJZiBmdW5jIGlzIDMgb3IgbW9yZSBhbmQgaXMgb2RkIChsb3cgYml0IGlz
IDEpLCB0aGVuIGRhdGEgaXMgICovCi0vKgkJYSBsb25nIHdvcmQsIGFuZCB0aGUga2VybmVsIHNl
dHMgdHVuaW5nIHBhcmFtZXRlciBudW1iZXJlZCAgICAqLwotLyoJCShmdW5jLTMpLzIgdG8gdGhh
dCB2YWx1ZS4JCQkJICAgICAgKi8KLS8qCQkgICAgCQkJCQkJCSAgICAgICovCi0vKgkJVGhlIHNl
dCBvZiBwYXJhbWV0ZXJzLCB0aGVpciB2YWx1ZXMsIGFuZCB0aGVpciBsZWdhbCByYW5nZXMgICAq
LwotLyoJCWFyZSBkZWZpbmVkIGluIHRoZSBrZXJuZWwgc291cmNlIGZpbGUgZnMvYnVmZmVyLmMu
IAkgICAgICAqLwotLyoJCQkJCQkJCQkgICAgICAqLwotLyoJCVJldHVybiBWYWx1ZToJCQkJCQkg
ICAgICAqLwotLyoJCUlmIGZ1bmMgaXMgbmVnYXRpdmUgb3IgMCBhbmQgdGhlIGRhZW1vbiBzdWNj
ZXNzZnVsbHkgc3RhcnRzLCAgKi8KLS8qCQliZGZsdXNoKCkgbmV2ZXIgcmV0dXJucy4gT3RoZXJ3
aXNlLCB0aGUgcmV0dXJuIHZhbHVlIGlzIDAgb24gICovCi0vKgkJc3VjY2VzcyBhbmQgLTEgb24g
ZmFpbHVyZSwgd2l0aCBlcnJubyBzZXQgdG8gaW5kaWNhdGUgdGhlICAgICAqLwotLyoJCWVycm9y
LgkJCQkJCQkgICAgICAqLwotLyoJCQkJCQkJCQkgICAgICAqLwotLyoJCUVycm9yczoJCQkJCQkJ
ICAgICAgKi8KLS8qCQkJRUJVU1kJCQkJCQkgICAgICAqLwotLyoJCQkgICAgQW4gYXR0ZW1wdCB3
YXMgbWFkZSB0byBlbnRlciB0aGUgZGFlbW9uIGNvZGUgYWZ0ZXIqLwotLyoJCQkgICAgYW5vdGhl
ciBwcm9jZXNzIGhhcyBhbHJlYWR5IGVudGVyZWQuIAkgICAgICAqLwotLyoJCQlFRkFVTFQJCQkJ
CQkgICAgICAqLwotLyoJCQkgICBhZGRyZXNzIHBvaW50cyBvdXRzaWRlIHlvdXIgYWNjZXNzaWJs
ZSBhZGRyZXNzICAgICAqLwotLyoJCQkgICBzcGFjZS4gCQkJCQkgICAgICAqLwotLyoJCQlFSU5W
QUwJCQkJCQkgICAgICAqLwotLyoJCQkgICAgQW4gYXR0ZW1wdCB3YXMgbWFkZSB0byByZWFkIG9y
IHdyaXRlIGFuIGludmFsaWQgICAqLwotLyoJCQkgICAgcGFyYW1ldGVyIG51bWJlciwgb3IgdG8g
d3JpdGUgYW4gaW52YWxpZCB2YWx1ZSB0byAqLwotLyoJCQkgICAgYSBwYXJhbWV0ZXIuIAkJCQkg
ICAgICAqLwotLyoJCQlFUEVSTQkJCQkJCSAgICAgICovCi0vKgkJCSAgICBDYWxsZXIgZG9lcyBu
b3QgaGF2ZSB0aGUgQ0FQX1NZU19BRE1JTiBjYXBhYmlsaXR5LiovCi0vKgkJCQkJCQkJCSAgICAg
ICovCi0vKiBVc2FnZTogIDxmb3IgY29tbWFuZC1saW5lPgkJCQkJCSAqLwotLyogYmRmbHVzaDAx
IFstYyBuXSBbLWVdWy1pIG5dIFstSSB4XSBbLXAgeF0gWy10XQkJICAgICAgKi8KLS8qICAgICAg
d2hlcmUsICAtYyBuIDogUnVuIG4gY29waWVzIGNvbmN1cnJlbnRseS4JCQkgICAgICovCi0vKgkg
ICAgICAtZSAgIDogVHVybiBvbiBlcnJubyBsb2dnaW5nLgkJCQkgKi8KLS8qCSAgICAgIC1pIG4g
OiBFeGVjdXRlIHRlc3QgbiB0aW1lcy4JCQkJICAqLwotLyoJICAgICAgLUkgeCA6IEV4ZWN1dGUg
dGVzdCBmb3IgeCBzZWNvbmRzLgkJCSAgICAqLwotLyoJICAgICAgLVAgeCA6IFBhdXNlIGZvciB4
IHNlY29uZHMgYmV0d2VlbiBpdGVyYXRpb25zLgkJKi8KLS8qCSAgICAgIC10ICAgOiBUdXJuIG9u
IHN5c2NhbGwgdGltaW5nLgkJCQkqLwotLyoJCQkJCQkJCQkgICAgKi8KLS8qIFRvdGFsIFRlc3Rz
OiAxCQkJCQkJCSAgICAgKi8KLS8qCQkJCQkJCQkJICAgICovCi0vKiBUZXN0IE5hbWU6ICAgYmRm
bHVzaDAxCQkJCQkgICAgICAqLwotLyogSGlzdG9yeTogICAgIFBvcnRpbmcgZnJvbSBDcmFja2Vy
amFjayB0byBMVFAgaXMgZG9uZSBieQkJICAgICovCi0vKgkgICAgICBNYW5hcyBLdW1hciBOYXlh
ayBtYWtuYXlha0Bpbi5pYm0uY29tPgkJCSovCi0vKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqLwotI2lu
Y2x1ZGUgPHN0ZGlvLmg+Ci0jaW5jbHVkZSA8c3RkbGliLmg+Ci0jaW5jbHVkZSA8c3lzL3dhaXQu
aD4KLSNpbmNsdWRlIDxzeXMvdHlwZXMuaD4KLSNpbmNsdWRlIDx1bmlzdGQuaD4KLSNpbmNsdWRl
IDxlcnJuby5oPgotI2luY2x1ZGUgPHN5cy9zdGF0Lmg+Ci0KLSNpbmNsdWRlICJ0ZXN0LmgiCi0j
aW5jbHVkZSAibGFwaS9zeXNjYWxscy5oIgotCi1jaGFyICpUQ0lEID0gImJkZmx1c2gwMSI7Ci1p
bnQgdGVzdG5vOwotaW50IFRTVF9UT1RBTCA9IDE7Ci0KLXZvaWQgY2xlYW51cCh2b2lkKQotewot
CXRzdF9ybWRpcigpOwotfQotCi12b2lkIHNldHVwKHZvaWQpCi17Ci0JVEVTVF9QQVVTRTsKLQl0
c3RfdG1wZGlyKCk7Ci19Ci0KLWludCBtYWluKGludCBhYywgY2hhciAqKmF2KQotewotCWxvbmcg
ZGF0YTsKLQotCXRzdF9wYXJzZV9vcHRzKGFjLCBhdiwgTlVMTCwgTlVMTCk7Ci0KLQlzZXR1cCgp
OwotCi0JLyoKLQkgKiBUT0RPIChnYXJyY29vcCk6IGFkZCBtb3JlIGZ1bmN0aW9uYWwgdGVzdGNh
c2VzOyB0aGVyZSBhcmUgYSB0b24KLQkgKiBtaXNzaW5nLgotCSAqLwotCWRhdGEgPSAwOwotCXRz
dF9jb3VudCA9IDE7Ci0JZm9yICh0ZXN0bm8gPSAwOyB0ZXN0bm8gPCBUU1RfVE9UQUw7ICsrdGVz
dG5vKSB7Ci0JCVRFU1QobHRwX3N5c2NhbGwoX19OUl9iZGZsdXNoLCAzLCBkYXRhKSk7Ci0JCWlm
IChURVNUX1JFVFVSTiA9PSAtMSkKLQkJCXRzdF9icmttKFRGQUlMIHwgVFRFUlJOTywgY2xlYW51
cCwgImJkZmx1c2ggZmFpbGVkIik7Ci0JCWVsc2UKLQkJCXRzdF9yZXNtKFRQQVNTLCAiYmRmbHVz
aCgpID0gJWxkIiwgVEVTVF9SRVRVUk4pOwotCX0KLQljbGVhbnVwKCk7Ci0JdHN0X2V4aXQoKTsK
LX0KLS0gCjIuMjEuMC4xMDIwLmdmMjgyMGNmMDFhLWdvb2cKCgotLSAKTWFpbGluZyBsaXN0IGlu
Zm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
