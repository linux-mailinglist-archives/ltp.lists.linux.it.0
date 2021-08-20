Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6DC3F288D
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 10:35:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A97233C4F45
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 10:35:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C8B043C4F14
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 10:35:47 +0200 (CEST)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 923D3200AE4
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 10:35:46 +0200 (CEST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 05C0240763
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 08:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629448546;
 bh=6/kceCZY9fLVUauwo5UCAiz1LEri6C9dbK4fFB5aIe8=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=Fcy2bkB35gN/8beC0nmT8vkkPo6tUCa8tSaTjsSimNfOBRClN8FCrhNPMBdZZ0fWM
 XVvOfSMPWbmT7fzNxAzd7BVirys75jw/gi25YoDj1wJwN9VRU/LrOgIQ4ELke3yUig
 2QNVVzzIg6coXxCw7ys68LRzn2imXiqNnwb9pG5QUtws1C9TWYhW2QYqN1g+r8RD7I
 KPLs/u9lm7JtTw5KsNoKA7DQu2oeUKhK6zCBgXazdWFPVAHF5fTDDtsXjSagr0/tvH
 v9wzY5O3IGQCYZWX/xokC1boaPlf6lVOPVObk4FQUqO6gqtjGi2OGqc206dUDCjvCE
 dxjfMtaiv7A6A==
Received: by mail-ed1-f70.google.com with SMTP id
 k13-20020aa7c04d000000b003bf04c03fc4so4196973edo.22
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 01:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6/kceCZY9fLVUauwo5UCAiz1LEri6C9dbK4fFB5aIe8=;
 b=ukbeQijZOdlhan7co60ASPAk9bGFDYSeY6LcoRLQV1Vbg+9PvPt+H6ngak8iIS+7B7
 B2Kydmxpe+QrINdWslAh8+Z70SwmH4wSDwmTtolFWPENeq4eFikGo8TpOpdoc/ZRKQwY
 QSCry1yAEmfN3T5pLSNUKIuvpjGit68XchdnKGJoXsuiDltk4hBkO70nHLJkBxq1cewp
 lgWucTPxpbnuX65eOzwzCeRooFWvUn5aA+DalUOCRvRyGNE+iAt9OTKbglwm+/IsOCoM
 M6e51pgxL/iSZ/1ZGoYa6brauG4t7aTYnDw6qm4bJaIv8Y5tYpDrxMRPGpLEAxkdYS+g
 WVsA==
X-Gm-Message-State: AOAM531AGsxO077kzm/N6vkTgTt5OdOmFScXu9rh6c8TmdVrrRBlUhy/
 r42kRKPuD/CVko3aUZ6Br7wom0gzAs4wg0ClN+ugpdetl+e0A/b9we9sq6oUhPzuLSR65Y05A7i
 hFkuaA6ST2B9N9kfikMmwpF5VT8Dm
X-Received: by 2002:a17:906:1f54:: with SMTP id
 d20mr20775923ejk.48.1629448545585; 
 Fri, 20 Aug 2021 01:35:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9bavHFBF3bpGEajlHWao3/awtLGia8m5IOGFXBReegxIA5nMhVkbpAhSgjcUNftspQOhfwg==
X-Received: by 2002:a17:906:1f54:: with SMTP id
 d20mr20775914ejk.48.1629448545437; 
 Fri, 20 Aug 2021 01:35:45 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id d8sm3170834edy.19.2021.08.20.01.35.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 01:35:45 -0700 (PDT)
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210629121047.100391-1-krzysztof.kozlowski@canonical.com>
 <20210629121047.100391-4-krzysztof.kozlowski@canonical.com>
 <YR5/qcQyAiFjmVR0@yuki> <YR6AlmzBA35qo81r@yuki>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <79cc6f86-1317-9044-147e-8c1bfa2efdd6@canonical.com>
Date: Fri, 20 Aug 2021 10:35:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YR6AlmzBA35qo81r@yuki>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-1.4 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 3/4] syscalls/msgstress03: fix fork failure on
 small memory systems
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 19/08/2021 18:02, Cyril Hrubis wrote:
> Hi!
> And we do have a patchset that converts msgstress* to new library as
> well which merges msgstress03 and msgstress01. I will try to have a look
> into that as well.
> 
> http://patchwork.ozlabs.org/project/ltp/list/?series=233661

The question then would be who should rebase on whose work :)


Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
