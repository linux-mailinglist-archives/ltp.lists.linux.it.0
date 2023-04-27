Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B49556EFE88
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Apr 2023 02:29:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D64633CBFAF
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Apr 2023 02:29:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E57703CA6A7
 for <ltp@lists.linux.it>; Thu, 27 Apr 2023 02:29:28 +0200 (CEST)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 578621A00980
 for <ltp@lists.linux.it>; Thu, 27 Apr 2023 02:29:28 +0200 (CEST)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-54f88a34bd6so109801787b3.2
 for <ltp@lists.linux.it>; Wed, 26 Apr 2023 17:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1682555367; x=1685147367;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Ig9EQVq/7CxCfo+YyovEcwr6BHPofG74PydmMuTzjsU=;
 b=fpnmd1fYJd9PhQV9B4wrcIJ7KFOASqm0TQQX4rC5uny0I2sWISnCRFYmbVOBtBmq90
 wZeqi5ol+zi+nBHfhugQviUhFy+cwZYVpCblToLnEHUH3dz8Ixnw7eO0re3bBdqXV27S
 L35h2OaxG4GXr2UHPBi937aGf1wMamjlFOYbzf/XA0yPpMn0SOdKSGBu1BJ3NbaEvat6
 vQ/EyGFfUCKxQqoFwlHuQDmMl2G+DUa6L9rLOXp6EBAIsmwwqQksG9Q7KvjI5mLWXGEH
 rR7e+Q1TwomCb/OjQ68pV/5GGvG6JAnzkrUXKp8hlM7beikg/Lj7TMtE4HPvTWoPDFUG
 Z5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682555367; x=1685147367;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ig9EQVq/7CxCfo+YyovEcwr6BHPofG74PydmMuTzjsU=;
 b=bl8933gvL7X07SNe6N5one7YmIMIICoID+tyEPMUFGbOZmGXQPRGTSP9K8w55uq5x9
 USBHOOrTSFhybwrUL40KbMSjh9FJPWB1UsHsqYg/To4ebXs589mG80EewBnKd5fOf+31
 erm8eVctkYfIQ33RlzdulyOBvDgItTHUIq1CC9w3A7oUvatyapsodEhuPyYxLcdqvYO0
 +xGsQLNFmKU2Xnrt7PX46H+igQL26raRB2kHHirn+Jhfg2CQPW/daye4BsSwZmNlgcec
 jMiiwQi0GoQ9dz1aDa6pmS/XV6V2j7mREMI3So2NMbt7NlzYNsib33unFfo527/GqqbG
 mPRw==
X-Gm-Message-State: AC+VfDyF6WZnW9/RFYCx1jZDQ+bqxO4g+xScZJ2FZDtWNTgGHWzeBExo
 0ub4Ct45GX4wXQhmWQrXeJW5BhLqJmCd4bi3z8TLbRwHlDXD6Xi2e/3TUqHEQV7WHi6ZsVtIetH
 UHq7TcL9CtMHyysEiibRVM3iv+MKYul99L1mqXp7LC2Jnd97RqJHdsIhU
X-Google-Smtp-Source: ACHHUZ6ZvJjMTZjyNhlXxQq+A3prikWoMd2QCwyvOPLSQe0UbiKx+qGemji93Z3LzWJeen/MIdf3QbPttpg=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:690c:725:b0:556:d398:8714 with SMTP id
 bt5-20020a05690c072500b00556d3988714mr39069ywb.0.1682555366844; Wed, 26 Apr
 2023 17:29:26 -0700 (PDT)
Date: Thu, 27 Apr 2023 00:29:03 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
Message-ID: <20230427002905.1354207-1-edliaw@google.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-7.4 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v1 0/2] fcntl{34,36}: Fixes for Android arm64
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
From: Edward Liaw via ltp <ltp@lists.linux.it>
Reply-To: Edward Liaw <edliaw@google.com>
Cc: kernel-team@android.com, rpalethorpe@suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Fixes: 7643115aaacb ("fcntl{34,36}: Always use 64-bit flock struct to avoid EINVAL")

In Richard's commit I think that he had meant to write that the flock64
type (not fcntl64 type) had been removed from some libcs.  I believe
that was the reason why he added the my_flock64 type.

On Android arm64, this test was breaking for two reasons:

1. The my_flock64 type definition did not match the expected type when
compiled for 64 bits.
2. The test was mixing fcntl and the flock64 struct when compiled for 32
bits.

Both seem to be ok on x86_64 but not on arm64.  To fix it, I gated the
compat function on TST_ABI64 instead of tst_kernel_bits.

Also, I'm not sure that the my_flock64 struct is needed with these
patches.  I think that l64 can just have the flock64 type.

Edward Liaw (2):
  fcntl{34,36}: Only use fcntl64 with 32bit abi
  fcntl{34,36}: Use arch dependent types for my_flock64

 .../kernel/syscalls/fcntl/fcntl_common.h      | 24 ++++++++++++-------
 1 file changed, 15 insertions(+), 9 deletions(-)

--
2.40.1.495.gc816e09b53d-goog


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
