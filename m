Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2698983D
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 09:49:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 943193C1CF5
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 09:49:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 673633C1C81
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 09:49:13 +0200 (CEST)
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
 [209.85.222.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 89DC11A00F70
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 09:49:12 +0200 (CEST)
Received: by mail-ua1-f68.google.com with SMTP id z13so39919199uaa.4
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 00:49:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1kgIsZ44RRlcJP206tVFyOnrF5p9ssNO1UZGglXBel4=;
 b=nVhLvakOsFJSQUr8cuH5g4vShR3Jm7SZ3JhHPTxAQeJij56jMli89k00iHLjCdSdwH
 GqnLFvWpswSbyHKc9lfnhygH4fRTJ2x4pE6gCagXJMiUXMPC+AnDqSqpA6tQy9bt+b6r
 hUrGPH5a6gfG8KrDz6A6ASV+j0uN0f1Dhc6bziboO7ECqXo4NLjvRN022G1fqH25Bdrc
 kVKZ1ibZq3CAORzlAiY80mCORfVwokfBnZ+qhAZAIgBmpeasrD9J8KdJghThjdbM4XQD
 t55u2YVV5qIcW99Mw9GsXQFcWMHcnzsyxJtKyrxJXT4ywG/wJdNg+zNw4jMbIeD3zuRR
 dS+g==
X-Gm-Message-State: APjAAAU9NxGkf12x6iQr5hXZ64JnkKtHUMP0g7oDscy87oSfVLwIhsQK
 UsnkF3qALx4u959d+qhUfPDH7C6ImVxwVWzhoRPscA==
X-Google-Smtp-Source: APXvYqzduKtPu2GRB4b0Krh4G1XOuiL8i5qH5gtE67ImwRNaNKe6CyatzI77GH1ikmFwBpfEHYliVbUBKnI3Ex2Nw0o=
X-Received: by 2002:ab0:3384:: with SMTP id y4mr3590823uap.106.1565596151511; 
 Mon, 12 Aug 2019 00:49:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190812072431.24378-1-yixin.zhang@intel.com>
In-Reply-To: <20190812072431.24378-1-yixin.zhang@intel.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 12 Aug 2019 15:49:00 +0800
Message-ID: <CAEemH2cQKpE+3Z837WwXV4V4gySLsDsnH9i8wmg=F8Hh7u9GMQ@mail.gmail.com>
To: Yixin Zhang <yixin.zhang@intel.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH ltp] runtest/fs: remove non-acsii char from comment
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Applied.

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
