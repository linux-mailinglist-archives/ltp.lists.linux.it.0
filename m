Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B4014C248
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jan 2020 22:39:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 820ED3C2476
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jan 2020 22:39:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id CDDA73C2464
 for <ltp@lists.linux.it>; Tue, 28 Jan 2020 22:39:11 +0100 (CET)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 70D2D2003A9
 for <ltp@lists.linux.it>; Tue, 28 Jan 2020 22:39:11 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id d16so17832044wre.10
 for <ltp@lists.linux.it>; Tue, 28 Jan 2020 13:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mQeESbfVKYh5Abf5xYYrDDq7fRn618CJMqCo7L7GLrE=;
 b=rph8SfEn8pd2nwFTk2YouzY7+HbRaMwPzdbN+9WC0eJVJgbZp3EPlffGw13glmMzR3
 7rC3EMoIOHSkkBTphgQ13LbhRDWWSzNpmyKJbobiVfvUb5sjOEkGproJnSOhJeivC15H
 WEukcJxGFQ9e4RL0AfYrbB0JXwL13r45Zk4UjFhOZQDzxqaMwsvpiEErT16sJBu4Cb5F
 YGPQ89wBgOF0M2LeaF+b79Kp3qL98IGyWZYDne5/s0jn2bMb2Sg7QWhlm7261jsfexZ3
 vaINnnm48XkhnUn0wRN2pu8PiFguijdVOQsHLQ+5tTFdha1/AwLHJywbfbaM/Nt0Y/NB
 lr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=mQeESbfVKYh5Abf5xYYrDDq7fRn618CJMqCo7L7GLrE=;
 b=ubBTD+ivZ0La61gV8lAkip63RFlY7rfnb8kpOj7kT10DLrzAC482Q+GuD2vW47rWTl
 V0n/aWo80TxuQDBMQXfCOiwhpkE9rM+YndeozvOcMWJ/0rja9oc9h16YjcJQSWguU1fH
 6QVHFbbHEVyXMlLLigACiTh3//uoQYgZSJten/Wo0uqZQxnfGd2VrLUmLnOkvDJNxxRd
 X+ytJh5MRuK9nmILPth+LP966A6ZTnNooLKXMYXWtpcLX/hEVNDJSiGgD3yr8NJoXivW
 wuGSgoOB3o2tC94y4HOWFxs1cdfBwqhjSVIKFy/Y95AFWecEq+2n0Fj+FzlsD/ZG1OR5
 ZBcA==
X-Gm-Message-State: APjAAAWVLbfc0hV0gbYQd0dLAK3GMSdOg/T0nhWdFTd6Ly/R2s6UVXwI
 Nkqi2JZT7M8qDAN2+DfdJceyRk6Iync=
X-Google-Smtp-Source: APXvYqybCLcxYfifSffOahJE8GW3Xd3g3O0uVr6JGvzSKZaf6/F/E5cRQ8K6bDMXyyfWRcsnhQFvpw==
X-Received: by 2002:adf:ca07:: with SMTP id o7mr29927218wrh.49.1580247550594; 
 Tue, 28 Jan 2020 13:39:10 -0800 (PST)
Received: from dell5510 ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id n16sm27123919wro.88.2020.01.28.13.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2020 13:39:09 -0800 (PST)
Date: Tue, 28 Jan 2020 22:39:02 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Message-ID: <20200128213902.GA23927@dell5510>
References: <20200128212725.22781-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200128212725.22781-1-petr.vorel@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] ioctl02.c: check for struct termio
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> Test is meant to use legacy struct termio, so we need to check for it.
Hm, am I wrong, and we should rewrite ioctl01.c and ioctl02.c to use struct
termios? Or do we want to test with both new struct termios and legacy termio?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
