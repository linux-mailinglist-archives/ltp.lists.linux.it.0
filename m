Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AACCB588F
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Dec 2025 11:37:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1765449478; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=+kX1B39uFwzlHAxX0vGr/atWcLNq5LO5MyrD2NsOZG8=;
 b=UIRKk3DMhXDhlDFCyLnd83N1FT6gRpL8gKFtwtciTWcBbAzgVF2tV8B2CwS7VksVy4qVz
 OsqwjLdE81OZ6xUprs+PXI9d2R+728RACDFmdxxnm49sYTXiNMAPS0kkc6ztOLRX3oZRton
 tVfTuANs7MvNn6sXr6m2hg6kABcaSEA=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 635F53CF242
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Dec 2025 11:37:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A0EFA3CF1B4
 for <ltp@lists.linux.it>; Thu, 11 Dec 2025 11:37:44 +0100 (CET)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2D7F710007F9
 for <ltp@lists.linux.it>; Thu, 11 Dec 2025 11:37:44 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-37d275cb96cso5916891fa.2
 for <ltp@lists.linux.it>; Thu, 11 Dec 2025 02:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1765449463; x=1766054263; darn=lists.linux.it;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9BRTH/FEGnS97KG3LM0lBBvG1ySlWbwu0HJaW9O0rNw=;
 b=KjNge4hJhXsddOjV6awFimvWh4Mczd4HS9yEubl73DSokSGDq/jCoKJ2+g0fkAxE2C
 0ckT+L7ao8U+QL+6G6ptBay7VdxnVJ8j1RB6tehiwlv+crQnIIyNpoJXr37QVmbL6BHg
 UCCUa2K8opCv6nt0ZUJH3jQ1wlp93KXGUhtGaxzoyl5N07bvBZOc3WgT4oewRMtoKWpD
 iXc4MwfmU3pIa5QiCdwj8uAuX0NjH9gZJxaEgUZKSQhBkW5/zhggCwlIjGlYbFDrWede
 fotTVXVhU5L8vGrOz54M3B3LaZN04fIaX9/q1JA/7Y1GpCF4UXsw7Cq+47ehMsDwnKO4
 a+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765449463; x=1766054263;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9BRTH/FEGnS97KG3LM0lBBvG1ySlWbwu0HJaW9O0rNw=;
 b=gkMdOwzRL7byzhdT/zcOizKMTG65/fP0I1jjGLrtY1Ou7ihfN2GY5q683MaFSx2+M4
 m8POcd2pdUmnfaWoe98zb6gJVJoSyBsbLDHN6UXK05gHSmMYMAGHwPeMPZd/CK2CIVwI
 tZc/4SeJBoyrs1JMsnhctcz1ZPUmLhg3ESTc4aYZ9w8AjFNmEZKoU0dpG748MM69larG
 Ax9ZGZHRSr/G0Gmyn8vVWEHHcHcLIzRS74ODHqCOUFEkFUBXlF5SAJrRd0VMqULkpkqT
 M5GixlsccWIKzue5j5JOQ9ESlD+Fe8dQPUgTVNPX0XYO2xw0ADpbJrwd6sNpOxiD0F+Q
 8NKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKOFinG/JMMBqhcN7obbv7Q9dvh0TlueRWPpUOeCfJAwsb3699OQbiqRPs+BKMZOjEYWE=@lists.linux.it
X-Gm-Message-State: AOJu0Ywh32x+FuF+VDqIXYrNz5CDHxoHWUN+VbGPsm6KsT7t0ZqxpXEq
 x29BusIwnZcFz7eXVHDq5Ha0iOIBAAtraIV+sG3YuBrvSs0P7up9HiYlYaOz1LWp+5g=
X-Gm-Gg: AY/fxX5Bm8CFfiUOML+eoQMx3FYy2NSHU5cbVKw2MpxNRsbiVxFeENTYB9NkMJ+bNQR
 r4owlfBhb2kD4vSsT8Xs8IFKZK+gY2ogoYCp4KKR9QX+k12bcsDR433lOYTgZLC0unXr8A3I5CW
 SDDTHl7INGflrAkjTDn98yRo3RVLnbVNzOtpNAUxNBvzqahuk9fr8Do27D9njVXH400xgtrNdy0
 Eo69Ppqn84OTK/jATGpu3iHyX/9NyfDmobI1IDxUebM3zeE0v3mVSRgQ+99QtJWTfxZuCPi93Wf
 2GI8GtxmchFapAghhgdR7iw46G8HwKjiWqdxhNY0gOI2dJiKPOEnHcB97ML6tgdiyxtRHzva8Pu
 gjcpwGILarYmNvH376jJJXtBL420ATJ1LhHeLIEpp3P124Zn+sXb2UzBehB/Kw9yx/DWSXOhHpC
 v+uWIUzYKhdBGoQkdf3gk=
X-Google-Smtp-Source: AGHT+IERqS1L6ci7q8dGntRfw2/ZItR2qtmAlqrQG8XSEGr8iPup2BGl+AX1ZFkBRb6+fnmg6Y4WXQ==
X-Received: by 2002:a05:6512:33d6:b0:595:81e7:3daa with SMTP id
 2adb3069b0e04-598ee52e8c5mr2220693e87.27.1765449463194; 
 Thu, 11 Dec 2025 02:37:43 -0800 (PST)
Received: from localhost ([2a02:a31b:84a1:b780:6f4e:21d6:82d2:5333])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-598f2fa75efsm748663e87.69.2025.12.11.02.37.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 02:37:42 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 11 Dec 2025 11:37:41 +0100
Message-Id: <DEVBLPYYQNMS.3IOZO4CG4IAYU@suse.com>
To: "Petr Vorel" <pvorel@suse.cz>, <ltp@lists.linux.it>
X-Mailer: aerc 0.18.2
References: <20251209185557.20598-1-pvorel@suse.cz>
In-Reply-To: <20251209185557.20598-1-pvorel@suse.cz>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v4 0/4] tst_runas.c, ima_{conditionals,
 measurements}.sh enhancements
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Cc: selinux@vger.kernel.org, linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

thanks for adding this tool. We will probably need to update
documentation as well after this patch will be merged.

-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
