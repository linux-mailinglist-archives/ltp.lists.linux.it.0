Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DC79A27156F
	for <lists+linux-ltp@lfdr.de>; Sun, 20 Sep 2020 17:45:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5B4063C4E2C
	for <lists+linux-ltp@lfdr.de>; Sun, 20 Sep 2020 17:45:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 878B43C250E
 for <ltp@lists.linux.it>; Sun, 20 Sep 2020 17:45:17 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70137.outbound.protection.outlook.com [40.107.7.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 54382200A18
 for <ltp@lists.linux.it>; Sun, 20 Sep 2020 17:45:16 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XZvHY9H9EnlVTQysfyxGKJYvPAgqbZBi3eJ01kBtvWc3R0c9J4qOz6tmnO5vkqhFKJ79zaGDiKSrX4lNuf1xcXO7S8cKwjR98xezam7ag3heH2EZnoizxepmFtZ6FC9nAeyhPJZLjui+ioVTKkRpVVzoPoC6ORmsuGQ3+hTDXoy004BXu/PwMYjzSeheERGIhzk0eFWkyHMRSfWvsEN5Wty3wlrh3JBrkark8n0GvwHr/ONaBvY+kmPpgBDA47VQ1yIjn2itEPctz/xQICjvQfpOdyuxWlK9egp/ESFWlEpHKxvlZ3zu4fcdlO5grMjXdMwQXPbP1sDb1JfK0krRcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tgf9PjnL8mHM21iQPixsLQIXX/yOz1o659UoupetNw=;
 b=ObQfPOr5EJaVDbi/0aRIc7QjikwvVnZuz729HDZQKNYnFjDBrctU8ovZHcz/JegwijCASJjso4W6uXqcnVrYZcOm+xAtaNtPCjjZxmmhWcUprTislp+p8+zKjhVVAAkIS+BA/nbHKnd6Th1akl+uh6a7q8LqHALv/xo1BYuOBCyBVoaaNMRk0le2GwGdZx3URz5bMBIX4UUOrvmotbgvZBa4EyDfqRzbllwuh2SbE/hqoGiXKoxgAR8edi1LeIczOPg7SOybCV9ETqoxcUeqPu1vEIE/cIFSY4hua354rqtn5QQGKsjTOLsRnFwfAS9bIntwf2ypHI/cN7dKcqxpag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tgf9PjnL8mHM21iQPixsLQIXX/yOz1o659UoupetNw=;
 b=W9RCW5H7tY9s7Csy7NLzhDES2rj0+llWEC8PkHz3ERtRYMThW3lMhLrrw1eszwKYdNiWqFsnB2kp+QaStzZKKOR+k11KTvRzyRGBuJJhSJDWyTFTmsv2Wb5Nyi9Yq4EojgKIxIKEdgLTSjb09FS0piS3jfsnenPbzjhO0iDJyRs=
Authentication-Results: lists.linux.it; dkim=none (message not signed)
 header.d=none;lists.linux.it; dmarc=none action=none header.from=syrmia.com;
Received: from AM6PR03MB5233.eurprd03.prod.outlook.com (2603:10a6:20b:d1::19)
 by AM6PR03MB5941.eurprd03.prod.outlook.com (2603:10a6:20b:ea::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Sun, 20 Sep
 2020 15:45:14 +0000
Received: from AM6PR03MB5233.eurprd03.prod.outlook.com
 ([fe80::7918:e8f:d41f:6e68]) by AM6PR03MB5233.eurprd03.prod.outlook.com
 ([fe80::7918:e8f:d41f:6e68%4]) with mapi id 15.20.3391.015; Sun, 20 Sep 2020
 15:45:14 +0000
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200817102232.5902-1-Filip.Bozuta@syrmia.com>
 <20200817102232.5902-3-Filip.Bozuta@syrmia.com>
 <20200818143715.GC27964@yuki.lan> <20200908151202.GC17482@yuki.lan>
From: Filip Bozuta <Filip.Bozuta@syrmia.com>
Message-ID: <d15a3c4f-0b43-26a5-87de-36a42f41924e@syrmia.com>
Date: Sun, 20 Sep 2020 17:45:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
In-Reply-To: <20200908151202.GC17482@yuki.lan>
Content-Language: en-US
X-ClientProxiedBy: AM0PR01CA0079.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::20) To AM6PR03MB5233.eurprd03.prod.outlook.com
 (2603:10a6:20b:d1::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.43.153] (109.245.227.194) by
 AM0PR01CA0079.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend
 Transport; Sun, 20 Sep 2020 15:45:14 +0000
X-Originating-IP: [109.245.227.194]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e0874dd-c3d4-4617-c13f-08d85d7c2a91
X-MS-TrafficTypeDiagnostic: AM6PR03MB5941:
X-Microsoft-Antispam-PRVS: <AM6PR03MB59412B3304E6D3F4FF11F03CEB3D0@AM6PR03MB5941.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2KjChOU5qCtej1MPn2fwJpJxiaXrDE/1G8eyhTVlu6vIfYd3QTAFVwaxHuD/UU9F+xMTSw+22v2WiO1WadloZy1ALkDegTGQrevccfPkOxM0hTbkQnCEQvqDVDP8dULqd42ryAFi15ALr0yH6rpfSqXTGQOXOFd5zezLZ1m8T/usR4pME+WFk3kLwEAqlRqaOQP6kYxNMk9ogEiFFsxKxPFbw3ZXi9KxMVUnpNEc1qHChBN3yoNndmHIuQrAtEEzex4N33T7aaza9M1o2TcSx/nfAbUyU3tzyDTmJhS9t61oco9GwiBgTODOJhl8yp+tT9Pg1lZHf/jHuvraT+Y9jp30//lgua8vMbyWT+TRxHw2ajUkC8zGrNBMBRXnVQDq4HaHQjtusdB97ZXIFAIRrKLk5GSpQjNtoyKF9TCbWz0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR03MB5233.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(366004)(136003)(39830400003)(396003)(86362001)(956004)(31696002)(8676002)(26005)(4326008)(2616005)(31686004)(52116002)(6486002)(186003)(478600001)(16526019)(6916009)(36756003)(5660300002)(316002)(66476007)(8936002)(66946007)(16576012)(4744005)(53546011)(66556008)(2906002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: Imh2Jzokm7AGb8S7tJEjEyxVwFFzXFfFY84cmQfOmT5s0fA6UcDuWyoXPxToG0iWiNubdt7zKicq8sRY8tGPbtZW9XoqDRAI7jCGN/BFmUASnGEMMfK0LxpgwnKJPBdPPdDLwI/ZWEgOOUhS3lH0ZLkZmgVh3km1994DKR+TpubncsaLyhw+aNJ7jriOhgkzktSAO753m54eBUCiv8QkgY/AqAAcBGBQgQUTvG+zSVrM2C8TrPfd+DM2RQmUfqSxrhbJ5suSxnwQbNq62PSTwBa9eiqfo1HPj+fzdyhuv3+NM1UWkiD9DQ++wI2kJhUKLhaY3dpia2zFQesB5d5ATJ7yZfWKOY3uN8GJQmacgCBWbD0VTGm4lUvSfRKGFWr3Yatr+NhuGS2ZkA1MiLpi2Xh2iBgaMrR2/Ed80fp3HAjMvHMpurqe1GDyp4D5TAHaAGApnBJ+kihrx09AFOACTxhdKHkLJ9rcZvvaDVxXL6Sw+vcbbSG6GdLyaSv0NNDHhXPFZZgKdOxca4H/9aIn8FbMsP0D6HH98V5NKIWHZkxSOE24FeWgTbXpfyndcx/PBtUZkf2CKRvxS3/UeyEKVT3ly01MamFU430Um01o74ViuoSxskcxNz8i/Us8fCRwXCXdH4o2zGyCrVMUnggSFQ==
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e0874dd-c3d4-4617-c13f-08d85d7c2a91
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB5233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2020 15:45:14.6087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uExEAoFiRoQ5j2XkFeYC/6X/0EdPPCstiV96shDnyl1yMQrQrN1jpGLG0jjSJvcUbjTXRP7QMHgiRVFcpYu+Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB5941
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/2] syscalls/{send|recv}mmsg: add a test case
 for timeout and errno test
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
Cc: laurent@vivier.eu, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

On 9/8/2020 5:12 PM, Cyril Hrubis wrote:
> Hi!
> Ping. Are you going to send v4?

Sorry for my late response. I had some obligations and haven't got to 
seeing the mails.

I have sent v4 about 20 days ago but I marked it as v3 by mistake. I 
will resend the patch now as v4 sou you can take a look.


Best regards,

Filip

>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
