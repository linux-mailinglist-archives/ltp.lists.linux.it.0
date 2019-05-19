Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A5222593
	for <lists+linux-ltp@lfdr.de>; Sun, 19 May 2019 02:38:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 06BD03EA4EB
	for <lists+linux-ltp@lfdr.de>; Sun, 19 May 2019 02:38:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 4534F3EA4DD
 for <ltp@lists.linux.it>; Sun, 19 May 2019 02:38:41 +0200 (CEST)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 520ED2003B1
 for <ltp@lists.linux.it>; Sun, 19 May 2019 02:38:40 +0200 (CEST)
Received: by mail-pg1-x543.google.com with SMTP id w22so5023724pgi.6
 for <ltp@lists.linux.it>; Sat, 18 May 2019 17:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XZndZJhIYBJixWnZhEHSeXuFfKwiETcBDkSMpTV3wtk=;
 b=L7rUBTGW8sDpVdnG1xy0bllgvYFQ+XSEI+zoheKkBpAM2AXZ0twUN/6RJhh2CLQ89u
 W7Vpa3njcrNtxLqxOtQTVpqhJEDxCbroVhT2BUN5boldQUsq6JiB21bOPCVkaRIZOFgl
 R/VcteACyOHKMb63eOKxq/yH+SWo9gPjB3ntO2sE/uGYnwGCflXfwFXdKwP8lBnwnWWI
 Q5j4LUDt3pwxkqAzTrXHNVK9c3IWR7+icLM3n6wAKEM89fsFgw+uICKSzi9jc9YUU0tr
 5MbNqE+v+rcEC7/BuxoI9woCvV50dGxl+5X3YOYxRdLf6xBm0u3Dm3/JXVCSWu/7+Hdm
 4nHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XZndZJhIYBJixWnZhEHSeXuFfKwiETcBDkSMpTV3wtk=;
 b=mWOPkXl9P25HbLvtMbqgDMNMRvNbl7Hr0rJmvHSW7Y8JdylqXLXOcaVgBkcXShCWQE
 +1jaBqPw8+myA2Hn4eaVxgkfUqvG73z0U7fNPFEnboI6yrD2egL0hhHYvrHNWH4eLX6U
 MZkg4uilErvZrvUQpJ70IW9UivPp9ma+DGjpO6pw2dHoNgK+9hIbS4Db0PvUeM7q9vMc
 vF0Tb9wc3dqz5Ygye+Uf+PrOCex8HfZQb/8X9WxuyLU3uhOjd2U7w97UulWX+dT8GzHN
 kkq5gBPzPGob5W5j3/6xTifkMBc5hVqIhuCo/VEVv3pk2MGs3vi9u+tNNNVnk0s9IHas
 YPGw==
X-Gm-Message-State: APjAAAUJl2Ofai2KTHF36N3MschfNDmacmPBv5SyUwO2i9zs+zmGFNIU
 y9WPNVNpJDZjLdotEO8gQssr+WOQWVo=
X-Google-Smtp-Source: APXvYqzGTRRgRLQzuDh7GhiPazq+KW8I0wrZlxAAhAX1HlfFTi83MygmqgTMitenOWJ0F+DFKyiJMg==
X-Received: by 2002:aa7:928b:: with SMTP id j11mr71252983pfa.200.1558226318581; 
 Sat, 18 May 2019 17:38:38 -0700 (PDT)
Received: from sspatil-glaptop2.unitedwifi.com ([104.153.224.166])
 by smtp.gmail.com with ESMTPSA id t5sm14592814pgn.80.2019.05.18.17.38.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 18 May 2019 17:38:37 -0700 (PDT)
From: Sandeep Patil <sspatil@android.com>
To: ltp@lists.linux.it
Date: Sat, 18 May 2019 17:38:03 -0700
Message-Id: <20190519003808.47425-1-sspatil@android.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: chrubis@suze.cz, kernel-team@android.com
Subject: [LTP] [PATCH 0/5] New library conversion for few system call tests
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

Rm9sbG93aW5nIHNlcmllcyBpcyBhIHNldCBvZiBzeXN0ZW0gY2FsbCB0ZXN0cyB0aGF0IGFyZSBj
b252ZXJ0ZWQgdG8gbmV3CmxpYnJhcnkuIEFsc28gZGVsZXRlZCBiZGZsdXNoIHRlc3QgYXQgdGhl
IHNhbWUgdGltZS4gSSBoYXZlIGJlZW4gZ29pbmcKdGhyb3VnaCB0aGUgc3lzdGVtIGNhbGwgdGVz
dHMgYWxwaGFiZXRpY2FsbHkgYW5kIGNvbnZlcnQgdGhlbSB0byBuZXcKbGlicmFyeSBhcyBhcHBs
aWNhYmxlLCBzbyB0aGVyZSB3aWxsIGJlIG1vcmUgdG8gY29tZS4KCkkgaGF2ZSB0ZXN0ZWQgdGhp
cyBvbiBjdXR0bGVmaXNoWzFdIGFuZCBtYWRlIHN1cmUgdGhleSBkb24ndCByZWdyZXNzLgoKMS4g
aHR0cHM6Ly9saW51eHBsdW1iZXJzY29uZi5vcmcvZXZlbnQvMi9jb250cmlidXRpb25zLzI2OS9h
dHRhY2htZW50cy81Ni82My9LZXJuZWxfSGFja2luZ193aXRoX0N1dHRsZWZpc2gucGRmCgpTYW5k
ZWVwIFBhdGlsICg1KToKICBzeXNjYWxscy9hZGp0aW1leDAxOiBDb252ZXJ0IHRvIG5ldyBsaWJy
YXJ5CiAgc3lzY2FsbHMvYWRqdGltZXgwMjogQ29udmVydCB0byBuZXcgbGlicmFyeQogIHN5c2Nh
bGxzL2FzeW5jaW8wMjogY29udmVydCB0byBuZXcgbGlicmFyeS4KICBzeXNjYWxscy9iZGZsdXNo
MDE6IGRlbGV0ZSBiZGZsdXNoIHRlc3QKICBzeXNjYWxscy9iaW5kMDE6IGNvbnZlcnQgdG8gbmV3
IGxpYnJhcnkuCgogLi4uL2tlcm5lbC9zeXNjYWxscy9hZGp0aW1leC9hZGp0aW1leDAxLmMgICAg
IHwgMTIyICsrLS0tLS0KIC4uLi9rZXJuZWwvc3lzY2FsbHMvYWRqdGltZXgvYWRqdGltZXgwMi5j
ICAgICB8IDMwNyArKysrKy0tLS0tLS0tLS0tLQogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9h
c3luY2lvL2FzeW5jaW8wMi5jIHwgMzIzICsrKystLS0tLS0tLS0tLS0tLQogdGVzdGNhc2VzL2tl
cm5lbC9zeXNjYWxscy9iZGZsdXNoLy5naXRpZ25vcmUgIHwgICAxIC0KIHRlc3RjYXNlcy9rZXJu
ZWwvc3lzY2FsbHMvYmRmbHVzaC9NYWtlZmlsZSAgICB8ICAyMyAtLQogdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9iZGZsdXNoL2JkZmx1c2gwMS5jIHwgMTI2IC0tLS0tLS0KIHRlc3RjYXNlcy9r
ZXJuZWwvc3lzY2FsbHMvYmluZC9iaW5kMDEuYyAgICAgICB8IDIwMSArKystLS0tLS0tLQogNyBm
aWxlcyBjaGFuZ2VkLCAyMTkgaW5zZXJ0aW9ucygrKSwgODg0IGRlbGV0aW9ucygtKQogZGVsZXRl
IG1vZGUgMTAwNjQ0IHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvYmRmbHVzaC8uZ2l0aWdub3Jl
CiBkZWxldGUgbW9kZSAxMDA2NDQgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9iZGZsdXNoL01h
a2VmaWxlCiBkZWxldGUgbW9kZSAxMDA2NDQgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9iZGZs
dXNoL2JkZmx1c2gwMS5jCgotLSAKMi4yMS4wLjEwMjAuZ2YyODIwY2YwMWEtZ29vZwoKCi0tIApN
YWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
