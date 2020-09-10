Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0752F264717
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 15:36:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 915293C52EB
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 15:36:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id EF1EB3C2891
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 15:36:17 +0200 (CEST)
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9CD136005CE
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 15:36:17 +0200 (CEST)
Received: by mail-io1-xd44.google.com with SMTP id r9so7093262ioa.2
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 06:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4vMQsIeZIlMHk8ZaaX6RWXplLeWRfPbrVewmy6neHlY=;
 b=JpLRrn56ufaDOUVWRkJNKzEubzEN62F5xHgk1U0MFq3+JKMd5Q99tqCeFUo6SM+lw6
 Ezx3WX1gHKIMZHpJ1Cf+FqJ+JEW5CqYkeEfJr53kNEnk2bN4EcqMbmiojf5NzpqHEu5H
 wNIALpJ/M+Pw2kefl757WSvbIl8flqeIdTZcHmKf9oWz6RCdoyYSpYJkyLhQESgxOUQd
 pWYDp0aSpt+ZpUz4kgiPnA0e5efSeglor/PdP4KV7sz0/53hfszxrh30OwSQRnKHZYez
 mAoXNTgih5inLc8oWW7H7jU4EMaDdJnRYsUPRs3num5C+975HMy139oIbUwKI1T9TmuC
 65Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4vMQsIeZIlMHk8ZaaX6RWXplLeWRfPbrVewmy6neHlY=;
 b=JQ5hGcJt/6nBUamjHdQ5Z3OGB+mA2hQrZz1NMUyYJ6B9+nun8BLUhR4NB9giBMZCyQ
 3cIeagL8b0sU8A7n2w5mt9OGMU5l5PgWrB8ke6MVKraRF+dVmxNDoh/wMYrrgQdLuF7o
 CDIeNTYxfzliP5raMT8quwlNMaLGPTXh387sXtZM3aG/0dl7IncvbyGz5Hl8iQuCQcNd
 kmFXwDl87oSamrgxidimzlje/7PvmNF7P0c2fB97+f/itTSZEbqefxlquJoCnMnsn0UB
 JHdDDJNFIek7eXD/KxNOcA2dUpV7W7Oq/Ko7YW//pGuW4gsvtFfubK32p2CLz5TxxhrN
 TJlw==
X-Gm-Message-State: AOAM5316fO8yonuyHYmPufkYyHrISu7pa+qCe2ZcdlH3axltI3GFi7Ew
 78b+/OGTcXsvyFg2QhoaDSuN+YNqQJemLCXkbMw=
X-Google-Smtp-Source: ABdhPJy3gAhcJMSGUtP5SYO5s7OB4QGP5tutsz9MadVF1AgJ3yqz8ap7tnrGLVl/Fkdcml1/sUdZXDSZLy5BS7msf9k=
X-Received: by 2002:a02:734f:: with SMTP id a15mr8862354jae.120.1599744976187; 
 Thu, 10 Sep 2020 06:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200909175707.10670-1-amir73il@gmail.com>
 <20200910112730.GA7194@dell5510>
In-Reply-To: <20200910112730.GA7194@dell5510>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 10 Sep 2020 16:36:05 +0300
Message-ID: <CAOQ4uxjAwQcmSnsJ5=O88bi2zxAzAe8uXCgg4+5mF6qOmSBfGQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 00/10] Fanotify tests for v5.9
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
Cc: Jan Kara <jack@suse.cz>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Sep 10, 2020 at 2:27 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi Amir,
>
> > Following are the tests that were used to develop the upcoming fanotify
> > features in v5.9.
>
> > The inotify/dnotify tests and fanotify09 test case are regression tests
> > for a mid series bug that has been fixed before the merge.
> Patchset merged.
>
> > fanotify10 gets another set of test cases to catch yet another ignored
> > mask logic bug. The fix commit will be too hard to backport IMO, so
> > perhaps these test cases should go into a new test with .min_kver = "5.9".
> Can we just skip particular test with tst_parse_kver() or tst_kvcmp()? Because
> other tests are valid, thus why to skip them (which would be when using
> .min_kver).

Sure I did not know about tst_parse_kver() I will send a patch.

BTW, sorry for the wrong commit id in the test.
Your fix missed removing the old commit from comment:

  * Test cases #17-#23 are regression tests for commit:
  *
  *     497b0c5a7c06 fsnotify: send event to parent and child with single...
  *     eca4784cbb18 fsnotify: send event to parent and child with single...
  */

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
