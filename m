Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 456ABA87C18
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Apr 2025 11:42:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1744623739; h=content-type :
 message-id : date : to : references : in-reply-to : mime-version :
 subject : list-id : list-unsubscribe : list-archive : list-post :
 list-help : list-subscribe : from : reply-to : sender : from;
 bh=7D3BMTp3Aj09iXmfnEFebXgXEJ3bUV4+1bEEZhrbdO0=;
 b=PRbV9PRxL+5zeXCPsCP8Kr82ZyUOXeQXhLegLIHKiiVWJz+NGUigXEnNEkQgbgZOn5pGz
 eTcSWzRY90Kkgdj+b45rcVYFT8T2qkfflp721mxi3CMEwUyTH56Wuf5KHFJIDAHIA9aREZm
 T1GZARy+ylY2N0AQNh0LXfxaRJdDrHA=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B5A9D3CB6CC
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Apr 2025 11:42:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 43A8B3C02BF
 for <ltp@lists.linux.it>; Mon, 14 Apr 2025 11:42:17 +0200 (CEST)
Authentication-Results: in-5.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=harshvardhan.j.jha@oracle.com;
 receiver=lists.linux.it)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9AA78600C8C
 for <ltp@lists.linux.it>; Mon, 14 Apr 2025 11:42:16 +0200 (CEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E9YPHw013491;
 Mon, 14 Apr 2025 09:42:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=9+FHYg9K7JLWCMC2vT
 80bsfY0iN3ii2U/BMaEi2X6Io=; b=AbwlD2GFO11JPv2Y9OzfDmOw7B0EQ2bRcE
 7aiqZFGzSBItAyv8poiy9gk1iklHe842JRL2O78320wyIWUfEj81gh1PstP4w//M
 IcYZKBcwdJSp2r7Jtc6fuwCDR0FNZTeGJa+adAgdWPiC3R3XZu7oNX3AhNe2A15a
 JiTIYwAMYY0jo0Ofj0fia42JYprM8bspxglB8HhG/836WRb8B9SvlUuEbNUGjeoi
 4PE3PvcK6CdaVpZVmXbC/KjXTy7BYhYGdcpdmMrvFWiFUSZ64Q2rqdHgnomFawuT
 ttsBnTH7/2c2LBJHS6IhTtN8gVkA0XLpONdDAl8NcCaBxiogbHvA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 460yucr0cp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Apr 2025 09:42:14 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 53E7gwtJ006587; Mon, 14 Apr 2025 09:42:13 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 460d5thj3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Apr 2025 09:42:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROLTgzZAWEo4wRnCaIpAl5jVCpt/4hkloQKMlbEAfC3F+CqJJMb6l7LYNh131C04CUNDJch0YID7Jbdc8FQywqEtqCFeIbLnqEMWp8bXr3Y257MzHpiDc8xVYSgSbOKuOql6MIoBfpTHgkfZhLDfDcnClnm34DcMj941Y3YXiViZCKRfgaOIDAjxf0FJpwM5YIj/D4vpfo+TALWD2SQqy1fB/mYjatYDSzZvpJb7gjDX5r0XMbl+rItl5TyrbEqFtEEPt6n6gZ7dWpvDSuEugQm/N3nKpIunyE2f7YZCNF4cJ7rIdgZRYN57WsWHGZMR0ATMQjCVPOqqVenGEYx2MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+FHYg9K7JLWCMC2vT80bsfY0iN3ii2U/BMaEi2X6Io=;
 b=lrFZ18dvfGrSdpaWMsPUr8TBWZcmflFqkTnZZPjmvJeTxoNW5RIcYYUpIEkYh0RODmZB22z6nCHHPvs5/RyjAxgrAjEvnnqCcH7jjRNUqXp8RlwO1sH7v+8CDdN+lD6ZU9zNf/6T59lTnIGSBe/S/+aZvzWWAKJP5NAaIY0qzY30FrrOn7MdfBCnqAw+dUttveV8Jnv7tldx3nUfu+6Nuwh2Lg+J2tLFlGYu88UdveX2NpntRkxtPOut39SeQJZ6dhC877OhDDE6pr8SLICfl+5ZMH0EsZTfGZPggNC7zvwO64QRXyYPBPsFr4p/dKMJJOkbAVWrzOGc8Uq9xLdSsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+FHYg9K7JLWCMC2vT80bsfY0iN3ii2U/BMaEi2X6Io=;
 b=B4WgeGjbbzNH4dDizezjPm/ynfjPJYVuYO6OvqY30dyXtvsJ/1bMqcpZI5Cv/2YI5IAkQbfDi2lES0zphXui+9/TVXxCgmdeVqAe26gidbdGIeMjHIQXEXnk0SwY2Bx1dySIzDA4CxcYR/5bX1ob7PFAcojDOpj33jor+fj/0uI=
Received: from PH7PR10MB6505.namprd10.prod.outlook.com (2603:10b6:510:200::11)
 by CH2PR10MB4199.namprd10.prod.outlook.com (2603:10b6:610:7f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Mon, 14 Apr
 2025 09:42:11 +0000
Received: from PH7PR10MB6505.namprd10.prod.outlook.com
 ([fe80::83d9:1bf1:52cf:df54]) by PH7PR10MB6505.namprd10.prod.outlook.com
 ([fe80::83d9:1bf1:52cf:df54%3]) with mapi id 15.20.8606.033; Mon, 14 Apr 2025
 09:42:11 +0000
Content-Type: multipart/mixed; boundary="------------enqYGFMiMhRfVSrS7sjs3t7G"
Message-ID: <12bd4542-33b9-4c84-9aa2-7483396982cd@oracle.com>
Date: Mon, 14 Apr 2025 15:12:05 +0530
User-Agent: Mozilla Thunderbird
To: Martin Doucha <mdoucha@suse.cz>, ltp@lists.linux.it
References: <86c52948-2408-4a15-9600-fcf30ea14f66@oracle.com>
 <4b5a393e-7d72-4d2f-b42b-cd5cf705b410@suse.cz>
Content-Language: en-US
In-Reply-To: <4b5a393e-7d72-4d2f-b42b-cd5cf705b410@suse.cz>
X-ClientProxiedBy: SGXP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::36)
 To PH7PR10MB6505.namprd10.prod.outlook.com
 (2603:10b6:510:200::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR10MB6505:EE_|CH2PR10MB4199:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bba662d-fe68-411e-ee34-08dd7b38a112
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|4053099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVBWOERpOHFyOWxqRHpSbmNrZG1qU0lXSjZYM2pyUFVtNDhmOTBPUnRMRzQv?=
 =?utf-8?B?NlpLbmpCbkpyYmNiaDVzUE9xU1dzWmp3WUdJMWlZeUNQL01WTTgrczhpcnc2?=
 =?utf-8?B?bEwvcGlpSWtndy9pMDJPQk1GVkhwVXZJYk13eGhnQWhET2pKb0ZkUHJIZTkr?=
 =?utf-8?B?V0YvYTN1YTJpdTVxUUMwMDE4cFlUZVpUc2tSYmFFSzM4NXpHODZWZFo5YzVC?=
 =?utf-8?B?V0F2ZkpxbGU3bXp3U3d0dElQZFZCVUdrYmNrNXc1REpab3NScXpQZ3pLQXVU?=
 =?utf-8?B?N2RPZFUzTW4vUS9lYTZWUnl3M25pYUtEd1A2Q0hVbUhGb0cvK1l5NzlXUnpX?=
 =?utf-8?B?YllSRjhWS3ZFU0twOWR5RE4xRjZ1WFUwZkN3VUQwQ0RHb0RlQkNxdlJSb0Uv?=
 =?utf-8?B?WGxBcUhRc0Q2SlVLWFlNbGR6cXRoWDhsMGhOWGg3Q2tHOFlwTjlYclZjbFd2?=
 =?utf-8?B?V2tXc1NVb09aelhrQ24vb09XU3RFN3N1dlVnYWpKcys5L0IyTnJ6UkNGQVJK?=
 =?utf-8?B?MXUwcGNJZ3V2UFgrYkg3YzFDQWpmTGlSU2YwSzF5MzlyU3BMU1ExTnpPZ1o1?=
 =?utf-8?B?SFBETjVKSWpoN3VyZFlNK1NHdmNjQ2hPby9KU1ZNUFB1OFJuWTJDUnUwRWxl?=
 =?utf-8?B?d1plQytSRXM0aXRBSTNJa2FnNkZCVEx2Y2EybDJTNVZFV05Vc1MyZ2xDU1Bv?=
 =?utf-8?B?YmlwY2JRL1J3NzdQcGVXMUlES2FlSVhsREliWjZCbGlram1UOHBKWW1HQ0Ux?=
 =?utf-8?B?OCt6cTk1dFdxVE1QQVA4M1k0OThOb0JpSU1JbS9yM3pweWZTWDhta3BsYUJx?=
 =?utf-8?B?Z3RzMUtSSmVJcmZ0bHR3MXpjNVpLVTJ2VWF4MHNMeDZxbERNMXBidlVheDFy?=
 =?utf-8?B?OEZvS3lobFVEbnFUU1A1WmxDLzhIaktoYmFnUzZrbFdoMk9LZ2RQZStGbk42?=
 =?utf-8?B?dDJkK2k2dmlFSkJ6bDVCL0xOYjA3VFVpZEJVT04rTGRTMElycmdTUmxRRHND?=
 =?utf-8?B?R2Frb0Q4UUYwWTJnTHozNmN1SE5TdmNVVFNNKy9QSS9xeEtyZUo4V1hvSW5v?=
 =?utf-8?B?VGVqLzIyWTFoc2RzeWRpK2NqTlhldVBuR0Z3M0Q0akxmL2RyWG5DQ2duWE1S?=
 =?utf-8?B?cktHZlFQQWVEZ2pHenJjZTRtZjlPSU1GeFJBVSswaUhSMW56MlQ4cTN6Umxv?=
 =?utf-8?B?V0JoY1ZveWNQTEp0VDhTUDUxcTV4VnIxMVBBbENCRVI0b2E4Z0JPV1FUTXV4?=
 =?utf-8?B?V01qVVkyZ0pTUnFGRDY2eUpSdHJRT0pza3E3WUVRWm11cDEydjdtTGtJWDJC?=
 =?utf-8?B?VldxVXVZSG5QTkZNQTUvdmxPS2V3OFlKZFZxMjFxMHhMdWIzUXJ0UWJXOXhZ?=
 =?utf-8?B?dUxnMHE1YzFodmdReGFDU2h4cHNKM2VBTS9UNllvSHV1cGlCdmZYUzRSUThS?=
 =?utf-8?B?QXE0bHY2bTJZRm80WEtPWnZHblEzYklOdXBDUTZ1WVdVVjFFVlJ6UUlYZXlS?=
 =?utf-8?B?cVY1ODI4dk5DOEh6TE9GUG1PRHM2TUdtMHdFWU5nWmdaeDgrRHJqamMyWXV2?=
 =?utf-8?B?Ky9WbWoxbGtTRDhnNHBQVFQrbHQ1NE0wK1grMHh6K0cyNVpuNzNZSHRtdUh0?=
 =?utf-8?B?ZTRiWHQ2S0JqYXV0NTlCNktUR3o1aW9zVDdCTUFMR2t5QUthaUFuenJvM3RR?=
 =?utf-8?B?SUtuMjNVMXppSTRaY25JdVg2eHY1ak9VN21McnE2cVRHVG10S2prSjY4SlI1?=
 =?utf-8?B?UWZNZ1VnNVVMc3J4L1dYV1JYcmxIZnpwSFYrYk1xeHlYWWwwcHlYWmh4UlFQ?=
 =?utf-8?B?aWdDandpUlVpUkYvN3AwazNQSytyZ2RtZkREWmxpd0kwWlBtL25VLzBKZ0o4?=
 =?utf-8?B?NmNRd2MzZUVqU1ZCS2VWSXg5YkNpNlpPQ3JyQnFIQ2JNdlp3TE1QcWZ5ZkFh?=
 =?utf-8?Q?GE4RZnGqe7A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR10MB6505.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(4053099003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUZGWkVyemlpQ0tOalZ5RFM2bkpkVDlrRGdRQ2VrYnd3UjZYYk9tVlVTVzND?=
 =?utf-8?B?Q2wwaHYzQTlOMThFN3gvTEkrTlJPVjJ2MXNzcHVFU1lMNE5PMnM5Y3h1K0Y3?=
 =?utf-8?B?NVlTN1BSUTFjSld6SStEdDVqdlNvTWdhRGhmdURFSW5MbVhLU2dIMTROODI3?=
 =?utf-8?B?MWUwUVpEU1gxdG5OSC9yNUtXQjZHamw4djJCblE1bVNtVWVYbkg4bGFCdXlU?=
 =?utf-8?B?blN6YldiREl4SFBkWjZVck85ZC8ybWY2NHRiNHlDRFJ4WGF3ekJlcWhNKzRy?=
 =?utf-8?B?dzVTRTJkVEVJM21oaXZCaG9mL2pTazRhblZVRzJtdk1aUEJHeGtBMzhNMDZq?=
 =?utf-8?B?SVExano4RmJ5Q2Nidy9JdkpEcXBpNm12NXc4VWtMeEJnam51eHBocG9JbVJl?=
 =?utf-8?B?VHZLQ2hFbCtGNS9va0t1RFlPcGw0OUYyVTJ1UFNCTUZHWGcrdFdTVng0RG1y?=
 =?utf-8?B?bDY2bWh0cWE5RjNqVVB0b2R4S0oydndCWXk5bEw2OStMMnNxekVOM1BaV1R6?=
 =?utf-8?B?UTZSM2JLcWRYd08xYVVIclJXYTRPb3Y4RVdsdXg4aDdrd2dCMTVwQVNEamw3?=
 =?utf-8?B?ZSt1NjVEWWE1elFWMWFiNkNERlBldHF4d0lxWmFvN2svdm80VDdwcjFDekM0?=
 =?utf-8?B?bFJCUW9OZEovbWlXb3ByakhFeSsxajd2aEFoR2hZdDRHSTZBc0o1dFNFeURK?=
 =?utf-8?B?d3FpYXRJeFlBQVNRWXBSYjBsRUplU2tKOHBodWg0WkI2MHlwRi80MHZuMDY3?=
 =?utf-8?B?eWI3SDJGcTluUTcxYVNRU3RGZUtacnR1dWR3U3NFaTJCOTMzSmc4STV2Q0F5?=
 =?utf-8?B?ciswWGZiRGh3clhtQng2c1JuNjhiWTNEbEdwN3FHMFNLaDRtd0pZK05RZVFi?=
 =?utf-8?B?c2loQ0pZRWFsZWVTNDlLMzBUM1IrUmtBcFlrVTZackMxbVlMMzcvRllvZkdV?=
 =?utf-8?B?SzZTK3U4MUx1RHBFYlFxeGtTeUU1U1pZQnlFOFUyZFBYeXRndHY4RjZlczFr?=
 =?utf-8?B?cnJuT1JrdWZQaUxLSDBRcFhGSmttQVRtRmxIME92S0pUZXZTMkJZVHpZZ1Fw?=
 =?utf-8?B?b3BWNisvVjhLWDh5TXZGczJ5bDVDUmRQTjQvUFY2Nzk4b3E5TlZ3cjhwZXdW?=
 =?utf-8?B?WXQ5MGtpUVNpd2dZempLeEJjMkpxM1MwSWQ4NFhUSWxEdDd5TTJienFoRGh0?=
 =?utf-8?B?eGg3TEVCaUYyMVhIKzdUT05UOWRTdDlrZm9Cb1RYcmxhWUsxTThFS09uOEdu?=
 =?utf-8?B?cnZOSGhYUXUzcGlHUjU5NUhOTlZPc3JXNFFiM1RSdWxxdFBsTnA3Zi96YnFv?=
 =?utf-8?B?ZXJzdG1nTFluWmdZVGZxLzF5YmFmOExFVlkrSlczcUhkblg2WG4rTGo4Wk84?=
 =?utf-8?B?d2x2Yi93MnhoVFN1b0M1TlBoRDU5ajgvZjFyZjFFYVFjNTdpYUdMbEM1UjE0?=
 =?utf-8?B?bGo0TjBaR21TcWVKQmVhY0R1SUtVcXNBb2hIa2d2TjZwN1E2ZktoN0RLeWUx?=
 =?utf-8?B?bEdnSkVEY2svT1pPZC9MVlFSenFJVTdidjVJNzB3dXR0aVVxRXhLL3U4d09H?=
 =?utf-8?B?cnRvdjZseC9YVXlRcGl1QW85Z1dvRW9aVjZlNjBGdisvdEJQaTlvZHlHWThm?=
 =?utf-8?B?ajNYbHpkZ3B4N3l5N0tNeUp2ZHpFVWZseDJPZnlnUlJUa29vWjdOenFpVHdT?=
 =?utf-8?B?R2JQLzR2QkUwRUw3U3dNVnRBK0FEVnhhdVVHUFNCWWVyUmpWWmhKME54dkEr?=
 =?utf-8?B?czhTeklOZ1dFYUFmTlRnenc2Rkp5UmNJS3pSeUt5MXVvY2owVTVjc1VkK3hH?=
 =?utf-8?B?a3pZWmloT0N2TTI5L29KbStUM3RvODRUWTRzK09YcmdNRkFKZjduamZCbmpu?=
 =?utf-8?B?dWtoaUpINnA3Q2dtdjE4L0hzMzVYSm9GQ0UzRzJsUGhlVnZhUSs3blRkbWpF?=
 =?utf-8?B?SHk4UzVlM21ueFF5V2VYaFBUL0FNcngvN04za0srTDJwVDhkWVZNTFI5Ukoy?=
 =?utf-8?B?ZE1wamJidkVzZXc5bTJ0NnZZS29SWWd2VHRJV1NoQzE4RjM5cU9tMTdicm9U?=
 =?utf-8?B?MVVVWTRIT2RIY2hyUzBpWlhRZEFGVkhMS25ZaVIrQkhBckExWU5Ob0FONlJX?=
 =?utf-8?B?RUpsSEZxalNYNkVNdEU3dEFyOXduYVBPTmRzUXZ3UWJvWHU0aDNWN2N2dHM3?=
 =?utf-8?B?RWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: SKwrwNXy6ztk2/e0QL7ssAoY1Eei8ACikF3SpSLFizLCNnOIJlMlr61I2dJdli7cEVyX53KE71C6icDCbti8ew5TsYZ88jAhHEHwdjGwtzwg/qfmSWVwD769zOdHQdzQDKnkyE9bZVVCWqhGQS32OmaLkS1HFSfcujgNIL7iAmGbn6OdCFVuLwgmAep0iB+7adb8/jJl2ZH9Ok5srvolyhc2vRBUav1X8GNgtm9QI+DgDSL7RzfF30jXDvt1yDxcf4YWnPTgv8fx1KZd2uOP7HlUgjjHlV2X51hihZcrPJl/e+EYxbyuL+RycPQHcDe0d9CgPxGEmDSLJkRW1kiHfh+mcXwNooeDs6TyDZ88Me6Hg0CDcMgxkHNfD4m4CfGH9W4KPc1hbIAHLFPcGnYHjWuJPnrLLO1jIjrXWcKmwzz2PVP8kxS+FsliEHylk6PCNTAn/IhPQfY9MjbswNy8J0BRXBli/5E9PMkqxFNUJqcsK2L20QJicakPe2XObA0wAHrJLyl45p097cIo/h93cQHZjoHcPhysv479vO6zUVhEP0QqEFRPHq3HoY3zIaj1lZf9WVJgH62VV34jn3fVUvXNv/AWBKnC96ngxi60h74=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bba662d-fe68-411e-ee34-08dd7b38a112
X-MS-Exchange-CrossTenant-AuthSource: PH7PR10MB6505.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 09:42:11.2471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RqpvcpjDtiqZe+HH3g6HVcI6S/ubz6i7jbPpyaBf0LUNOYHCqWxgA6Vzd8QEqQ8PTzcbkLZJ1v1CsEz0EFA/iM4mbaQAqSdshkrVMEClP8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4199
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504140069
X-Proofpoint-GUID: 3QZnGn-XvgvzLjT5QChylTc8JydIYOUk
X-Proofpoint-ORIG-GUID: 3QZnGn-XvgvzLjT5QChylTc8JydIYOUk
X-Spam-Status: No, score=0.1 required=7.0 tests=ARC_SIGNED,ARC_VALID,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] Test failures observed on 6.15 kernel in memcontrol04
 test suite
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
From: Harshvardhan Jha via ltp <ltp@lists.linux.it>
Reply-To: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--------------enqYGFMiMhRfVSrS7sjs3t7G
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Martin,

On 09/04/25 6:42 PM, Martin Doucha wrote:
> On 09. 04. 25 12:31, Harshvardhan Jha via ltp wrote:
>> Hi there,
>>
>> I've been observing 5 failures on vanilla 6.15 kernel when running ltp
>> memcontrol04 test and I've attached the logs to this email. Please let
>> me know if this is a kernel issue or due to outdated test case.
>> Something similar was observed on 6.14 and it was rectified iirc.
>
> Hi,
> this is a minor kernel bug and our colleague is working on a fix[1].
> You can safely ignore any failures described as "F low
> events=<nonzero>" in the test output.
>
> [1]
> https://urldefense.com/v3/__https://bugzilla.suse.com/show_bug.cgi?id=1196298__;!!ACWV5N9M2RV99hQ!PicXqj3LGuf-pdgmn4JAALFdplA83-YDyrV61zaU-GUz8czlbHHzCqwt0aUChk41PmYxrGaozow9h4-ldcqXBZ5K$
>

I tried running this on a 6.12 kernel and on that kernel this test
doesn't run and is shown to be broken. I've attached the file to this email.

Thanks & Regards,
Harshvardhan

--------------enqYGFMiMhRfVSrS7sjs3t7G
Content-Type: text/plain; charset=UTF-8;
 name="6.12.0-0.20.20.1.el10uek.x86_64-memcontrol04.txt"
Content-Disposition: attachment;
 filename="6.12.0-0.20.20.1.el10uek.x86_64-memcontrol04.txt"
Content-Transfer-Encoding: base64

R251IEMgICAgICAgICAgICAgICAgICBnY2MgKEdDQykgMTQuMi4xIDIwMjUwMTEwIChSZWQgSGF0
IDE0LjIuMS03KQpDbGFuZyAgICAgICAgICAgICAgICAgCkdudSBtYWtlICAgICAgICAgICAgICAg
NC40LjEKdXRpbC1saW51eCAgICAgICAgICAgICAyLjQwLjIKbW91bnQgICAgICAgICAgICAgICAg
ICB1dGlsLWxpbnV4IDIuNDAuMiAobGlibW91bnQgMi40MC4yOiBzZWxpbnV4LCBidHJmcywgbmFt
ZXNwYWNlcywgaWRtYXBwaW5nLCBmZC1iYXNlZC1tb3VudCwgc3RhdHgsIGFzc2VydCwgZGVidWcp
Cm1vZHV0aWxzICAgICAgICAgICAgICAgMzEKYnRyZnMgICAgICAgICAgICAgICAgICB2Ni4xMgpl
MmZzcHJvZ3MgICAgICAgICAgICAgIDEuNDcuMQpleGZhdCAgICAgICAgICAgICAgICAgIDEuMi4y
CnZmYXQgICAgICAgICAgICAgICAgICAgNC4yCnhmcyAgICAgICAgICAgICAgICAgICAgNi4xMS4w
CkxpbnV4IEMgTGlicmFyeSAgICAgICAgR05VIEMgTGlicmFyeSAoR05VIGxpYmMpIHN0YWJsZSBy
ZWxlYXNlIHZlcnNpb24gMi4zOS4KRHluYW1pYyBsaW5rZXIgKGxkZCkgICAyLjM5ClByb2NwcyAg
ICAgICAgICAgICAgICAgNC4wLjQKTmV0LXRvb2xzICAgICAgICAgICAgICAyLjEwLWFscGhhCmlw
cm91dGUyICAgICAgICAgICAgICAgMS41LjAKaXB1dGlscyAgICAgICAgICAgICAgICAyMDI0MDkw
NQpldGh0b29sICAgICAgICAgICAgICAgIDYuMTEKU2gtdXRpbHMgICAgICAgICAgICAgICA5LjUK
Ck1vZHVsZXMgTG9hZGVkICAgICAgICAgZXh0NCBqYmQyIGV4dDIgbWJjYWNoZSBuZnRfcmVkaXIg
cmZraWxsIGlwdF9SRUpFQ1QgeHRfY29tbWVudCB4dF9vd25lciBuZnRfY29tcGF0IG5mdF9maWJf
aW5ldCBuZnRfZmliX2lwdjQgbmZ0X2ZpYl9pcHY2IG5mdF9maWIgbmZ0X3JlamVjdF9pbmV0IG5m
X3JlamVjdF9pcHY0IG5mX3JlamVjdF9pcHY2IG5mdF9yZWplY3QgbmZ0X2N0IG5mdF9jaGFpbl9u
YXQgbmZfbmF0IG5mX2Nvbm50cmFjayBuZl9kZWZyYWdfaXB2NiBuZl9kZWZyYWdfaXB2NCBpcF9z
ZXQgdmZhdCBmYXQgaW50ZWxfcmFwbF9tc3IgYm9jaHMgZHJtX3ZyYW1faGVscGVyIGRybV90dG1f
aGVscGVyIHR0bSBpbnRlbF9yYXBsX2NvbW1vbiBkcm1fa21zX2hlbHBlciBpMmNfcGlpeDQgcGNz
cGtyIGkyY19zbWJ1cyBwdnBhbmljX21taW8gcHZwYW5pYyBzZyBkcm0gZnVzZSBsb29wIHZzb2Nr
X2xvb3BiYWNrIHZtd192c29ja192aXJ0aW9fdHJhbnNwb3J0X2NvbW1vbiB2bXdfdnNvY2tfdm1j
aV90cmFuc3BvcnQgdnNvY2sgdm13X3ZtY2kgeGZzIG52bWVfdGNwIG52bWVfZmFicmljcyBudm1l
X2tleXJpbmcgbnZtZV9jb3JlIG52bWVfYXV0aCBhdGFfZ2VuZXJpYyBzZF9tb2QgY3JjdDEwZGlm
X3BjbG11bCBwYXRhX2FjcGkgY3JjMzJfcGNsbXVsIGF0YV9waWl4IGdoYXNoX2NsbXVsbmlfaW50
ZWwgc2hhNTEyX3Nzc2UzIGxpYmF0YSB2aXJ0aW9fbmV0IHNoYTI1Nl9zc3NlMyBzaGExX3Nzc2Uz
IG5ldF9mYWlsb3ZlciB2aXJ0aW9fc2NzaSBmYWlsb3ZlciBzZXJpb19yYXcgYnRyZnMgYmxha2Uy
Yl9nZW5lcmljIHhvciB6c3RkX2NvbXByZXNzIHJhaWQ2X3BxIHN1bnJwYyBkbV9taXJyb3IgZG1f
cmVnaW9uX2hhc2ggZG1fbG9nIGJlMmlzY3NpIGJueDJpIGNuaWMgdWlvIGN4Z2I0aSBjeGdiNCB0
bHMgY3hnYjNpIGN4Z2IzIG1kaW8gbGliY3hnYmkgbGliY3hnYiBxbGE0eHh4IGlzY3NpX2Jvb3Rf
c3lzZnMgaXNjc2lfdGNwIGxpYmlzY3NpX3RjcCBsaWJpc2NzaSBzY3NpX3RyYW5zcG9ydF9pc2Nz
aSBkbV9tdWx0aXBhdGggZG1fbW9kIHFlbXVfZndfY2ZnIHZpcnRpb19wY2kgdmlydGlvX3BjaV9s
ZWdhY3lfZGV2IHZpcnRpb19wY2lfbW9kZXJuX2RldiBhZXNuaV9pbnRlbCBnZjEyOG11bCBjcnlw
dG9fc2ltZCBjcnlwdGQKCmNwdWluZm86CkFyY2hpdGVjdHVyZTogICAgICAgICAgICAgICAgICAg
ICAgICAgeDg2XzY0CkNQVSBvcC1tb2RlKHMpOiAgICAgICAgICAgICAgICAgICAgICAgMzItYml0
LCA2NC1iaXQKQWRkcmVzcyBzaXplczogICAgICAgICAgICAgICAgICAgICAgICA0MCBiaXRzIHBo
eXNpY2FsLCA0OCBiaXRzIHZpcnR1YWwKQnl0ZSBPcmRlcjogICAgICAgICAgICAgICAgICAgICAg
ICAgICBMaXR0bGUgRW5kaWFuCkNQVShzKTogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
OApPbi1saW5lIENQVShzKSBsaXN0OiAgICAgICAgICAgICAgICAgIDAtNwpWZW5kb3IgSUQ6ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIEF1dGhlbnRpY0FNRApCSU9TIFZlbmRvciBJRDogICAg
ICAgICAgICAgICAgICAgICAgIFFFTVUKTW9kZWwgbmFtZTogICAgICAgICAgICAgICAgICAgICAg
ICAgICBBTUQgRVBZQyA3NTUxIDMyLUNvcmUgUHJvY2Vzc29yCkJJT1MgTW9kZWwgbmFtZTogICAg
ICAgICAgICAgICAgICAgICAgcGMtaTQ0MGZ4LTcuMiAgQ1BVIEAgMi4wR0h6CkJJT1MgQ1BVIGZh
bWlseTogICAgICAgICAgICAgICAgICAgICAgMQpDUFUgZmFtaWx5OiAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDIzCk1vZGVsOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMQpUaHJl
YWQocykgcGVyIGNvcmU6ICAgICAgICAgICAgICAgICAgIDIKQ29yZShzKSBwZXIgc29ja2V0OiAg
ICAgICAgICAgICAgICAgICA0ClNvY2tldChzKTogICAgICAgICAgICAgICAgICAgICAgICAgICAg
MQpTdGVwcGluZzogICAgICAgICAgICAgICAgICAgICAgICAgICAgIDIKQm9nb01JUFM6ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAzOTkyLjUwCkZsYWdzOiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZnB1IHZtZSBkZSBwc2UgdHNjIG1zciBwYWUgbWNlIGN4OCBhcGljIHNlcCBt
dHJyIHBnZSBtY2EgY21vdiBwYXQgcHNlMzYgY2xmbHVzaCBtbXggZnhzciBzc2Ugc3NlMiBodCBz
eXNjYWxsIG54IG1teGV4dCBmeHNyX29wdCBwZHBlMWdiIHJkdHNjcCBsbSByZXBfZ29vZCBub3Bs
IHh0b3BvbG9neSBjcHVpZCBleHRkX2FwaWNpZCB0c2Nfa25vd25fZnJlcSBwbmkgcGNsbXVscWRx
IHNzc2UzIGZtYSBjeDE2IHNzZTRfMSBzc2U0XzIgeDJhcGljIG1vdmJlIHBvcGNudCB0c2NfZGVh
ZGxpbmVfdGltZXIgYWVzIHhzYXZlIGF2eCBmMTZjIHJkcmFuZCBoeXBlcnZpc29yIGxhaGZfbG0g
Y21wX2xlZ2FjeSBjcjhfbGVnYWN5IGFibSBzc2U0YSBtaXNhbGlnbnNzZSAzZG5vd3ByZWZldGNo
IG9zdncgdG9wb2V4dCBwZXJmY3RyX2NvcmUgc3NiZCBpYnBiIHZtbWNhbGwgZnNnc2Jhc2UgdHNj
X2FkanVzdCBibWkxIGF2eDIgc21lcCBibWkyIHJkc2VlZCBhZHggc21hcCBjbGZsdXNob3B0IHNo
YV9uaSB4c2F2ZW9wdCB4c2F2ZWMgeGdldGJ2MSB4c2F2ZXMgY2x6ZXJvIHhzYXZlZXJwdHIgdmly
dF9zc2JkIGFyYXQgb3ZlcmZsb3dfcmVjb3Ygc3VjY29yIGFyY2hfY2FwYWJpbGl0aWVzCkh5cGVy
dmlzb3IgdmVuZG9yOiAgICAgICAgICAgICAgICAgICAgS1ZNClZpcnR1YWxpemF0aW9uIHR5cGU6
ICAgICAgICAgICAgICAgICAgZnVsbApMMWQgY2FjaGU6ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDI1NiBLaUIgKDQgaW5zdGFuY2VzKQpMMWkgY2FjaGU6ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDI1NiBLaUIgKDQgaW5zdGFuY2VzKQpMMiBjYWNoZTogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDIgTWlCICg0IGluc3RhbmNlcykKTDMgY2FjaGU6ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAxNiBNaUIgKDEgaW5zdGFuY2UpCk5VTUEgbm9kZShzKTogICAgICAgICAgICAg
ICAgICAgICAgICAgMQpOVU1BIG5vZGUwIENQVShzKTogICAgICAgICAgICAgICAgICAgIDAtNwpW
dWxuZXJhYmlsaXR5IEdhdGhlciBkYXRhIHNhbXBsaW5nOiAgIE5vdCBhZmZlY3RlZApWdWxuZXJh
YmlsaXR5IEl0bGIgbXVsdGloaXQ6ICAgICAgICAgIE5vdCBhZmZlY3RlZApWdWxuZXJhYmlsaXR5
IEwxdGY6ICAgICAgICAgICAgICAgICAgIE5vdCBhZmZlY3RlZApWdWxuZXJhYmlsaXR5IE1kczog
ICAgICAgICAgICAgICAgICAgIE5vdCBhZmZlY3RlZApWdWxuZXJhYmlsaXR5IE1lbHRkb3duOiAg
ICAgICAgICAgICAgIE5vdCBhZmZlY3RlZApWdWxuZXJhYmlsaXR5IE1taW8gc3RhbGUgZGF0YTog
ICAgICAgIE5vdCBhZmZlY3RlZApWdWxuZXJhYmlsaXR5IFJlZyBmaWxlIGRhdGEgc2FtcGxpbmc6
IE5vdCBhZmZlY3RlZApWdWxuZXJhYmlsaXR5IFJldGJsZWVkOiAgICAgICAgICAgICAgIE1pdGln
YXRpb247IHVudHJhaW5lZCByZXR1cm4gdGh1bms7IFNNVCB2dWxuZXJhYmxlClZ1bG5lcmFiaWxp
dHkgU3BlYyByc3RhY2sgb3ZlcmZsb3c6ICAgVnVsbmVyYWJsZTogU2FmZSBSRVQsIG5vIG1pY3Jv
Y29kZQpWdWxuZXJhYmlsaXR5IFNwZWMgc3RvcmUgYnlwYXNzOiAgICAgIE1pdGlnYXRpb247IFNw
ZWN1bGF0aXZlIFN0b3JlIEJ5cGFzcyBkaXNhYmxlZCB2aWEgcHJjdGwKVnVsbmVyYWJpbGl0eSBT
cGVjdHJlIHYxOiAgICAgICAgICAgICBNaXRpZ2F0aW9uOyB1c2VyY29weS9zd2FwZ3MgYmFycmll
cnMgYW5kIF9fdXNlciBwb2ludGVyIHNhbml0aXphdGlvbgpWdWxuZXJhYmlsaXR5IFNwZWN0cmUg
djI6ICAgICAgICAgICAgIE1pdGlnYXRpb247IFJldHBvbGluZXM7IElCUEIgY29uZGl0aW9uYWw7
IFNUSUJQIGRpc2FibGVkOyBSU0IgZmlsbGluZzsgUEJSU0ItZUlCUlMgTm90IGFmZmVjdGVkOyBC
SEkgTm90IGFmZmVjdGVkClZ1bG5lcmFiaWxpdHkgU3JiZHM6ICAgICAgICAgICAgICAgICAgTm90
IGFmZmVjdGVkClZ1bG5lcmFiaWxpdHkgVHN4IGFzeW5jIGFib3J0OiAgICAgICAgTm90IGFmZmVj
dGVkCgpmcmVlIHJlcG9ydHM6CiAgICAgICAgICAgICAgIHRvdGFsICAgICAgICB1c2VkICAgICAg
ICBmcmVlICAgICAgc2hhcmVkICBidWZmL2NhY2hlICAgYXZhaWxhYmxlCk1lbTogICAgICAgIDMy
Mzk3MjU2ICAgICAgODI2Nzg4ICAgIDI5NTIyODIwICAgICAgICA4OTA0ICAgICAyNDU5NTg4ICAg
IDMxNTcwNDY4ClN3YXA6ICAgICAgICA2MjkxNDUyICAgICAgICAgICAwICAgICA2MjkxNDUyCgpt
ZW1vcnkgKC9wcm9jL21lbWluZm8pOgpNZW1Ub3RhbDogICAgICAgMzIzOTcyNTYga0IKTWVtRnJl
ZTogICAgICAgIDI5NTIyODIwIGtCCk1lbUF2YWlsYWJsZTogICAzMTU3MDQ2OCBrQgpCdWZmZXJz
OiAgICAgICAgICAgIDcyODAga0IKQ2FjaGVkOiAgICAgICAgICAyMzg2MjAwIGtCClN3YXBDYWNo
ZWQ6ICAgICAgICAgICAgMCBrQgpBY3RpdmU6ICAgICAgICAgICA0MzkwNDAga0IKSW5hY3RpdmU6
ICAgICAgICAyMTA1NjI0IGtCCkFjdGl2ZShhbm9uKTogICAgIDE2NzI0MCBrQgpJbmFjdGl2ZShh
bm9uKTogICAgICAgIDAga0IKQWN0aXZlKGZpbGUpOiAgICAgMjcxODAwIGtCCkluYWN0aXZlKGZp
bGUpOiAgMjEwNTYyNCBrQgpVbmV2aWN0YWJsZTogICAgICAgIDg5MzIga0IKTWxvY2tlZDogICAg
ICAgICAgICA4OTMyIGtCClN3YXBUb3RhbDogICAgICAgNjI5MTQ1MiBrQgpTd2FwRnJlZTogICAg
ICAgIDYyOTE0NTIga0IKWnN3YXA6ICAgICAgICAgICAgICAgICAwIGtCClpzd2FwcGVkOiAgICAg
ICAgICAgICAgMCBrQgpEaXJ0eTogICAgICAgICAgICAgICAgNjQga0IKV3JpdGViYWNrOiAgICAg
ICAgICAgICAwIGtCCkFub25QYWdlczogICAgICAgIDE2MDA1NiBrQgpNYXBwZWQ6ICAgICAgICAg
ICAxNDMxMzYga0IKU2htZW06ICAgICAgICAgICAgICA4OTA0IGtCCktSZWNsYWltYWJsZTogICAg
ICA2NjEwOCBrQgpTbGFiOiAgICAgICAgICAgICAxNzIwNjgga0IKU1JlY2xhaW1hYmxlOiAgICAg
IDY2MTA4IGtCClNVbnJlY2xhaW06ICAgICAgIDEwNTk2MCBrQgpLZXJuZWxTdGFjazogICAgICAg
IDUzODgga0IKUGFnZVRhYmxlczogICAgICAgICA0MjIwIGtCClNlY1BhZ2VUYWJsZXM6ICAgICAg
ICAgMCBrQgpORlNfVW5zdGFibGU6ICAgICAgICAgIDAga0IKQm91bmNlOiAgICAgICAgICAgICAg
ICAwIGtCCldyaXRlYmFja1RtcDogICAgICAgICAgMCBrQgpDb21taXRMaW1pdDogICAgMjI0OTAw
ODAga0IKQ29tbWl0dGVkX0FTOiAgICAxMTE1ODc2IGtCClZtYWxsb2NUb3RhbDogICAzNDM1OTcz
ODM2NyBrQgpWbWFsbG9jVXNlZDogICAgICAgMzIwMDAga0IKVm1hbGxvY0NodW5rOiAgICAgICAg
ICAwIGtCClBlcmNwdTogICAgICAgICAgICAgMzU4NCBrQgpIYXJkd2FyZUNvcnJ1cHRlZDogICAg
IDAga0IKQW5vbkh1Z2VQYWdlczogICAgIDY1NTM2IGtCClNobWVtSHVnZVBhZ2VzOiAgICAgICAg
MCBrQgpTaG1lbVBtZE1hcHBlZDogICAgICAgIDAga0IKRmlsZUh1Z2VQYWdlczogICAgIDgzOTY4
IGtCCkZpbGVQbWRNYXBwZWQ6ICAgICA3MTY4MCBrQgpDbWFUb3RhbDogICAgICAgICAgICAgIDAg
a0IKQ21hRnJlZTogICAgICAgICAgICAgICAwIGtCClVuYWNjZXB0ZWQ6ICAgICAgICAgICAgMCBr
QgpIdWdlUGFnZXNfVG90YWw6ICAgICAgIDAKSHVnZVBhZ2VzX0ZyZWU6ICAgICAgICAwCkh1Z2VQ
YWdlc19Sc3ZkOiAgICAgICAgMApIdWdlUGFnZXNfU3VycDogICAgICAgIDAKSHVnZXBhZ2VzaXpl
OiAgICAgICAyMDQ4IGtCCkh1Z2V0bGI6ICAgICAgICAgICAgICAgMCBrQgpEaXJlY3RNYXA0azog
ICAgICAyMjM5NzYga0IKRGlyZWN0TWFwMk06ICAgICA4MTU5MjMyIGtCCkRpcmVjdE1hcDFHOiAg
ICAyNzI2Mjk3NiBrQgoKYXZhaWxhYmxlIGZpbGVzeXN0ZW1zOgphdXRvZnMgYmRldiBicGYgYnRy
ZnMgY2dyb3VwIGNncm91cDIgY29uZmlnZnMgY3B1c2V0IGRlYnVnZnMgZGV2cHRzIGRldnRtcGZz
IGVmaXZhcmZzIGV4dDIgZXh0MyBleHQ0IGZ1c2UgZnVzZWJsayBmdXNlY3RsIGh1Z2V0bGJmcyBt
cXVldWUgcGlwZWZzIHByb2MgcHN0b3JlIHJhbWZzIHJwY19waXBlZnMgc2VjdXJpdHlmcyBzZWxp
bnV4ZnMgc29ja2ZzIHN5c2ZzIHRtcGZzIHRyYWNlZnMgdmZhdCB4ZnMgem9uZWZzCgptb3VudGVk
IGZpbGVzeXN0ZW1zICgvcHJvYy9tb3VudHMpOgovZGV2L21hcHBlci9vY2l2b2x1bWUtcm9vdCAv
IHhmcyBydyxzZWNsYWJlbCxyZWxhdGltZSxhdHRyMixpbm9kZTY0LGxvZ2J1ZnM9OCxsb2dic2l6
ZT0zMmssbm9xdW90YSAwIDAKcnBjX3BpcGVmcyAvdmFyL2xpYi9uZnMvcnBjX3BpcGVmcyBycGNf
cGlwZWZzIHJ3LHJlbGF0aW1lIDAgMApkZXZ0bXBmcyAvZGV2IGRldnRtcGZzIHJ3LHNlY2xhYmVs
LG5vc3VpZCxzaXplPTQwOTZrLG5yX2lub2Rlcz00MDM4MzUyLG1vZGU9NzU1LGlub2RlNjQgMCAw
CnRtcGZzIC9kZXYvc2htIHRtcGZzIHJ3LHNlY2xhYmVsLG5vc3VpZCxub2Rldixub2V4ZWMsaW5v
ZGU2NCAwIDAKZGV2cHRzIC9kZXYvcHRzIGRldnB0cyBydyxzZWNsYWJlbCxub3N1aWQsbm9leGVj
LHJlbGF0aW1lLGdpZD01LG1vZGU9NjIwLHB0bXhtb2RlPTAwMCAwIDAKc3lzZnMgL3N5cyBzeXNm
cyBydyxzZWNsYWJlbCxub3N1aWQsbm9kZXYsbm9leGVjLHJlbGF0aW1lIDAgMApzZWN1cml0eWZz
IC9zeXMva2VybmVsL3NlY3VyaXR5IHNlY3VyaXR5ZnMgcncsbm9zdWlkLG5vZGV2LG5vZXhlYyxy
ZWxhdGltZSAwIDAKY2dyb3VwMiAvc3lzL2ZzL2Nncm91cCBjZ3JvdXAyIHJ3LHNlY2xhYmVsLG5v
c3VpZCxub2Rldixub2V4ZWMscmVsYXRpbWUsbnNkZWxlZ2F0ZSxtZW1vcnlfcmVjdXJzaXZlcHJv
dCAwIDAKcHN0b3JlIC9zeXMvZnMvcHN0b3JlIHBzdG9yZSBydyxzZWNsYWJlbCxub3N1aWQsbm9k
ZXYsbm9leGVjLHJlbGF0aW1lIDAgMAplZml2YXJmcyAvc3lzL2Zpcm13YXJlL2VmaS9lZml2YXJz
IGVmaXZhcmZzIHJ3LG5vc3VpZCxub2Rldixub2V4ZWMscmVsYXRpbWUgMCAwCmJwZiAvc3lzL2Zz
L2JwZiBicGYgcncsbm9zdWlkLG5vZGV2LG5vZXhlYyxyZWxhdGltZSxtb2RlPTcwMCAwIDAKY29u
ZmlnZnMgL3N5cy9rZXJuZWwvY29uZmlnIGNvbmZpZ2ZzIHJ3LG5vc3VpZCxub2Rldixub2V4ZWMs
cmVsYXRpbWUgMCAwCnByb2MgL3Byb2MgcHJvYyBydyxub3N1aWQsbm9kZXYsbm9leGVjLHJlbGF0
aW1lIDAgMAp0bXBmcyAvcnVuIHRtcGZzIHJ3LHNlY2xhYmVsLG5vc3VpZCxub2RldixzaXplPTY0
Nzk0NTJrLG5yX2lub2Rlcz04MTkyMDAsbW9kZT03NTUsaW5vZGU2NCAwIDAKc2VsaW51eGZzIC9z
eXMvZnMvc2VsaW51eCBzZWxpbnV4ZnMgcncsbm9zdWlkLG5vZXhlYyxyZWxhdGltZSAwIDAKc3lz
dGVtZC0xIC9wcm9jL3N5cy9mcy9iaW5mbXRfbWlzYyBhdXRvZnMgcncscmVsYXRpbWUsZmQ9MzEs
cGdycD0xLHRpbWVvdXQ9MCxtaW5wcm90bz01LG1heHByb3RvPTUsZGlyZWN0LHBpcGVfaW5vPTE3
OTIgMCAwCm1xdWV1ZSAvZGV2L21xdWV1ZSBtcXVldWUgcncsc2VjbGFiZWwsbm9zdWlkLG5vZGV2
LG5vZXhlYyxyZWxhdGltZSAwIDAKaHVnZXRsYmZzIC9kZXYvaHVnZXBhZ2VzIGh1Z2V0bGJmcyBy
dyxzZWNsYWJlbCxub3N1aWQsbm9kZXYscmVsYXRpbWUscGFnZXNpemU9Mk0gMCAwCmRlYnVnZnMg
L3N5cy9rZXJuZWwvZGVidWcgZGVidWdmcyBydyxzZWNsYWJlbCxub3N1aWQsbm9kZXYsbm9leGVj
LHJlbGF0aW1lIDAgMAp0cmFjZWZzIC9zeXMva2VybmVsL3RyYWNpbmcgdHJhY2VmcyBydyxzZWNs
YWJlbCxub3N1aWQsbm9kZXYsbm9leGVjLHJlbGF0aW1lIDAgMAp0bXBmcyAvcnVuL2NyZWRlbnRp
YWxzL3N5c3RlbWQtam91cm5hbGQuc2VydmljZSB0bXBmcyBybyxzZWNsYWJlbCxub3N1aWQsbm9k
ZXYsbm9leGVjLHJlbGF0aW1lLG5vc3ltZm9sbG93LHNpemU9MTAyNGssbnJfaW5vZGVzPTEwMjQs
bW9kZT03MDAsaW5vZGU2NCxub3N3YXAgMCAwCi9kZXYvbWFwcGVyL29jaXZvbHVtZS1vbGVkIC92
YXIvb2xlZCB4ZnMgcncsc2VjbGFiZWwscmVsYXRpbWUsYXR0cjIsaW5vZGU2NCxsb2didWZzPTgs
bG9nYnNpemU9MzJrLG5vcXVvdGEgMCAwCi9kZXYvc2RhMiAvYm9vdCB4ZnMgcncsc2VjbGFiZWws
cmVsYXRpbWUsYXR0cjIsaW5vZGU2NCxsb2didWZzPTgsbG9nYnNpemU9MzJrLG5vcXVvdGEgMCAw
CmZ1c2VjdGwgL3N5cy9mcy9mdXNlL2Nvbm5lY3Rpb25zIGZ1c2VjdGwgcncsbm9zdWlkLG5vZGV2
LG5vZXhlYyxyZWxhdGltZSAwIDAKL2Rldi9zZGExIC9ib290L2VmaSB2ZmF0IHJ3LHJlbGF0aW1l
LGZtYXNrPTAwNzcsZG1hc2s9MDA3Nyxjb2RlcGFnZT00MzcsaW9jaGFyc2V0PWFzY2lpLHNob3J0
bmFtZT13aW5udCxlcnJvcnM9cmVtb3VudC1ybyAwIDAKdG1wZnMgL3J1bi91c2VyLzEwMDAgdG1w
ZnMgcncsc2VjbGFiZWwsbm9zdWlkLG5vZGV2LHJlbGF0aW1lLHNpemU9MzIzOTcyNGssbnJfaW5v
ZGVzPTgwOTkzMSxtb2RlPTcwMCx1aWQ9MTAwMCxnaWQ9MTAwMCxpbm9kZTY0IDAgMAp0bXBmcyAv
cnVuL2NyZWRlbnRpYWxzL2dldHR5QHR0eTEuc2VydmljZSB0bXBmcyBybyxzZWNsYWJlbCxub3N1
aWQsbm9kZXYsbm9leGVjLHJlbGF0aW1lLG5vc3ltZm9sbG93LHNpemU9MTAyNGssbnJfaW5vZGVz
PTEwMjQsbW9kZT03MDAsaW5vZGU2NCxub3N3YXAgMCAwCnRtcGZzIC9ydW4vY3JlZGVudGlhbHMv
c2VyaWFsLWdldHR5QHR0eVMwLnNlcnZpY2UgdG1wZnMgcm8sc2VjbGFiZWwsbm9zdWlkLG5vZGV2
LG5vZXhlYyxyZWxhdGltZSxub3N5bWZvbGxvdyxzaXplPTEwMjRrLG5yX2lub2Rlcz0xMDI0LG1v
ZGU9NzAwLGlub2RlNjQsbm9zd2FwIDAgMAp0bXBmcyAvcnVuL3VzZXIvOTg3IHRtcGZzIHJ3LHNl
Y2xhYmVsLG5vc3VpZCxub2RldixyZWxhdGltZSxzaXplPTMyMzk3MjRrLG5yX2lub2Rlcz04MDk5
MzEsbW9kZT03MDAsdWlkPTk4NyxnaWQ9OTg4LGlub2RlNjQgMCAwCi9kZXYvc2RiMSAvdG1wZGly
IHhmcyBydyxzZWNsYWJlbCxyZWxhdGltZSxhdHRyMixpbm9kZTY0LGxvZ2J1ZnM9OCxsb2dic2l6
ZT0zMmssbm9xdW90YSAwIDAKCm1vdW50ZWQgZmlsZXN5c3RlbXMgKGRmKToKRmlsZXN5c3RlbSAg
ICAgICAgICAgICAgICAgVHlwZSAgICAgIFNpemUgIFVzZWQgQXZhaWwgVXNlJSBNb3VudGVkIG9u
Ci9kZXYvbWFwcGVyL29jaXZvbHVtZS1yb290IHhmcyAgICAgICAxMzNHICAgMTdHICAxMTdHICAx
MyUgLwpkZXZ0bXBmcyAgICAgICAgICAgICAgICAgICBkZXZ0bXBmcyAgNC4wTSAgICAgMCAgNC4w
TSAgIDAlIC9kZXYKdG1wZnMgICAgICAgICAgICAgICAgICAgICAgdG1wZnMgICAgICAxNkcgICAg
IDAgICAxNkcgICAwJSAvZGV2L3NobQplZml2YXJmcyAgICAgICAgICAgICAgICAgICBlZml2YXJm
cyAgMjU2SyAgIDU3SyAgMTk1SyAgMjMlIC9zeXMvZmlybXdhcmUvZWZpL2VmaXZhcnMKdG1wZnMg
ICAgICAgICAgICAgICAgICAgICAgdG1wZnMgICAgIDYuMkcgIDguN00gIDYuMkcgICAxJSAvcnVu
CnRtcGZzICAgICAgICAgICAgICAgICAgICAgIHRtcGZzICAgICAxLjBNICAgICAwICAxLjBNICAg
MCUgL3J1bi9jcmVkZW50aWFscy9zeXN0ZW1kLWpvdXJuYWxkLnNlcnZpY2UKL2Rldi9tYXBwZXIv
b2Npdm9sdW1lLW9sZWQgeGZzICAgICAgICAxNUcgIDMyNk0gICAxNUcgICAzJSAvdmFyL29sZWQK
L2Rldi9zZGEyICAgICAgICAgICAgICAgICAgeGZzICAgICAgIDIuMEcgIDEuMkcgIDc2Nk0gIDYy
JSAvYm9vdAovZGV2L3NkYTEgICAgICAgICAgICAgICAgICB2ZmF0ICAgICAgMTAwTSAgNy42TSAg
IDkzTSAgIDglIC9ib290L2VmaQp0bXBmcyAgICAgICAgICAgICAgICAgICAgICB0bXBmcyAgICAg
My4xRyAgNC4wSyAgMy4xRyAgIDElIC9ydW4vdXNlci8xMDAwCnRtcGZzICAgICAgICAgICAgICAg
ICAgICAgIHRtcGZzICAgICAxLjBNICAgICAwICAxLjBNICAgMCUgL3J1bi9jcmVkZW50aWFscy9n
ZXR0eUB0dHkxLnNlcnZpY2UKdG1wZnMgICAgICAgICAgICAgICAgICAgICAgdG1wZnMgICAgIDEu
ME0gICAgIDAgIDEuME0gICAwJSAvcnVuL2NyZWRlbnRpYWxzL3NlcmlhbC1nZXR0eUB0dHlTMC5z
ZXJ2aWNlCnRtcGZzICAgICAgICAgICAgICAgICAgICAgIHRtcGZzICAgICAzLjFHICA0LjBLICAz
LjFHICAgMSUgL3J1bi91c2VyLzk4NwovZGV2L3NkYjEgICAgICAgICAgICAgICAgICB4ZnMgICAg
ICAgIDIwRyAgNDI0TSAgIDIwRyAgIDMlIC90bXBkaXIKCnRhaW50ZWQgKC9wcm9jL3N5cy9rZXJu
ZWwvdGFpbnRlZCk6CjAKCkFwcEFybW9yIGRpc2FibGVkCgpTRUxpbnV4IHN0YXR1czogICAgICAg
ICAgICAgICAgIGVuYWJsZWQKU0VMaW51eGZzIG1vdW50OiAgICAgICAgICAgICAgICAvc3lzL2Zz
L3NlbGludXgKU0VMaW51eCByb290IGRpcmVjdG9yeTogICAgICAgICAvZXRjL3NlbGludXgKTG9h
ZGVkIHBvbGljeSBuYW1lOiAgICAgICAgICAgICB0YXJnZXRlZApDdXJyZW50IG1vZGU6ICAgICAg
ICAgICAgICAgICAgIGVuZm9yY2luZwpNb2RlIGZyb20gY29uZmlnIGZpbGU6ICAgICAgICAgIGVu
Zm9yY2luZwpQb2xpY3kgTUxTIHN0YXR1czogICAgICAgICAgICAgIGVuYWJsZWQKUG9saWN5IGRl
bnlfdW5rbm93biBzdGF0dXM6ICAgICBhbGxvd2VkCk1lbW9yeSBwcm90ZWN0aW9uIGNoZWNraW5n
OiAgICAgYWN0dWFsIChzZWN1cmUpCk1heCBrZXJuZWwgcG9saWN5IHZlcnNpb246ICAgICAgMzMK
bm8gYmlnIGJsb2NrIGRldmljZSB3YXMgc3BlY2lmaWVkIG9uIGNvbW1hbmRsaW5lLgpUZXN0cyB3
aGljaCByZXF1aXJlIGEgYmlnIGJsb2NrIGRldmljZSBhcmUgZGlzYWJsZWQuCllvdSBjYW4gc3Bl
Y2lmeSBpdCB3aXRoIG9wdGlvbiAtegpDT01NQU5EOiAgICAvb3B0L2x0cC9iaW4vbHRwLXBhbiAg
IC1lIC1TICAgLWEgNDA0MDkgICAgIC1uIDQwNDA5IC1wIC1mIC90bXBkaXIvbHRwLTZZZmNnY2hF
YWQvYWxsdGVzdHMgLWwgL29wdC9sdHAvcmVzdWx0cy9MVFBfUlVOX09OLTIwMjVfMDRfMDktMTBo
XzAybV8zM3MubG9nICAtQyAvb3B0L2x0cC9vdXRwdXQvTFRQX1JVTl9PTi0yMDI1XzA0XzA5LTEw
aF8wMm1fMzNzLmZhaWxlZCAtVCAvb3B0L2x0cC9vdXRwdXQvTFRQX1JVTl9PTi0yMDI1XzA0XzA5
LTEwaF8wMm1fMzNzLnRjb25mCklORk86IFJlc3RyaWN0ZWQgdG8gbWVtY29udHJvbDA0CkxPRyBG
aWxlOiAvb3B0L2x0cC9yZXN1bHRzL0xUUF9SVU5fT04tMjAyNV8wNF8wOS0xMGhfMDJtXzMzcy5s
b2cKRkFJTEVEIENPTU1BTkQgRmlsZTogL29wdC9sdHAvb3V0cHV0L0xUUF9SVU5fT04tMjAyNV8w
NF8wOS0xMGhfMDJtXzMzcy5mYWlsZWQKVENPTkYgQ09NTUFORCBGaWxlOiAvb3B0L2x0cC9vdXRw
dXQvTFRQX1JVTl9PTi0yMDI1XzA0XzA5LTEwaF8wMm1fMzNzLnRjb25mClJ1bm5pbmcgdGVzdHMu
Li4uLi4uCjw8PHRlc3Rfc3RhcnQ+Pj4KdGFnPW1lbWNvbnRyb2wwNCBzdGltZT0xNzQ0MTkyOTU0
CmNtZGxpbmU9Im1lbWNvbnRyb2wwNCIKY29udGFjdHM9IiIKYW5hbHlzaXM9ZXhpdAo8PDx0ZXN0
X291dHB1dD4+Pgp0c3RfdG1wZGlyLmM6MzE2OiBUSU5GTzogVXNpbmcgL3RtcGRpci9sdHAtNllm
Y2djaEVhZC9MVFBfbWVtSjVvSUM3IGFzIHRtcGRpciAoeGZzIGZpbGVzeXN0ZW0pCnRzdF9kZXZp
Y2UuYzo5NjogVElORk86IEZvdW5kIGZyZWUgZGV2aWNlIDAgJy9kZXYvbG9vcDAnCnRzdF90ZXN0
LmM6MTkwMDogVElORk86IExUUCB2ZXJzaW9uOiAyMDI1MDEzMC0zOS1nN2YzOTIyYTI0CnRzdF90
ZXN0LmM6MTkwNDogVElORk86IFRlc3RlZCBrZXJuZWw6IDYuMTIuMC0wLjIwLjIwLjEuZWwxMHVl
ay54ODZfNjQgIzEgU01QIFBSRUVNUFRfRFlOQU1JQyBNb24gQXByICA3IDIxOjA1OjI4IFBEVCAy
MDI1IHg4Nl82NAp0c3Rfa2NvbmZpZy5jOjg4OiBUSU5GTzogUGFyc2luZyBrZXJuZWwgY29uZmln
ICcvbGliL21vZHVsZXMvNi4xMi4wLTAuMjAuMjAuMS5lbDEwdWVrLng4Nl82NC9jb25maWcnCnRz
dF90ZXN0LmM6MTcyMjogVElORk86IE92ZXJhbGwgdGltZW91dCBwZXIgcnVuIGlzIDBoIDAwbSAz
MHMKdHN0X3N1cHBvcnRlZF9mc190eXBlcy5jOjk3OiBUSU5GTzogS2VybmVsIHN1cHBvcnRzIGV4
dDIKdHN0X3N1cHBvcnRlZF9mc190eXBlcy5jOjYyOiBUSU5GTzogbWtmcy5leHQyIGRvZXMgZXhp
c3QKdHN0X3N1cHBvcnRlZF9mc190eXBlcy5jOjk3OiBUSU5GTzogS2VybmVsIHN1cHBvcnRzIGV4
dDMKdHN0X3N1cHBvcnRlZF9mc190eXBlcy5jOjYyOiBUSU5GTzogbWtmcy5leHQzIGRvZXMgZXhp
c3QKdHN0X3N1cHBvcnRlZF9mc190eXBlcy5jOjk3OiBUSU5GTzogS2VybmVsIHN1cHBvcnRzIGV4
dDQKdHN0X3N1cHBvcnRlZF9mc190eXBlcy5jOjYyOiBUSU5GTzogbWtmcy5leHQ0IGRvZXMgZXhp
c3QKdHN0X3N1cHBvcnRlZF9mc190eXBlcy5jOjk3OiBUSU5GTzogS2VybmVsIHN1cHBvcnRzIHhm
cwp0c3Rfc3VwcG9ydGVkX2ZzX3R5cGVzLmM6NjI6IFRJTkZPOiBta2ZzLnhmcyBkb2VzIGV4aXN0
CnRzdF9zdXBwb3J0ZWRfZnNfdHlwZXMuYzo5NzogVElORk86IEtlcm5lbCBzdXBwb3J0cyBidHJm
cwp0c3Rfc3VwcG9ydGVkX2ZzX3R5cGVzLmM6NjI6IFRJTkZPOiBta2ZzLmJ0cmZzIGRvZXMgZXhp
c3QKdHN0X3N1cHBvcnRlZF9mc190eXBlcy5jOjEwNTogVElORk86IFNraXBwaW5nIGJjYWNoZWZz
IGJlY2F1c2Ugb2YgRlVTRSBibGFja2xpc3QKdHN0X3N1cHBvcnRlZF9mc190eXBlcy5jOjE2OTog
VElORk86IFNraXBwaW5nIHZmYXQgYXMgcmVxdWVzdGVkIGJ5IHRoZSB0ZXN0CnRzdF9zdXBwb3J0
ZWRfZnNfdHlwZXMuYzoxNjk6IFRJTkZPOiBTa2lwcGluZyBleGZhdCBhcyByZXF1ZXN0ZWQgYnkg
dGhlIHRlc3QKdHN0X3N1cHBvcnRlZF9mc190eXBlcy5jOjE2OTogVElORk86IFNraXBwaW5nIG50
ZnMgYXMgcmVxdWVzdGVkIGJ5IHRoZSB0ZXN0CnRzdF9zdXBwb3J0ZWRfZnNfdHlwZXMuYzoxNjk6
IFRJTkZPOiBTa2lwcGluZyB0bXBmcyBhcyByZXF1ZXN0ZWQgYnkgdGhlIHRlc3QKdHN0X3Rlc3Qu
YzoxODMzOiBUSU5GTzogPT09IFRlc3Rpbmcgb24gZXh0MiA9PT0KdHN0X3Rlc3QuYzoxMTcwOiBU
SU5GTzogRm9ybWF0dGluZyAvZGV2L2xvb3AwIHdpdGggZXh0MiBvcHRzPScnIGV4dHJhIG9wdHM9
JycKbWtlMmZzIDEuNDcuMSAoMjAtTWF5LTIwMjQpCnRzdF90ZXN0LmM6MTE4MjogVElORk86IE1v
dW50aW5nIC9kZXYvbG9vcDAgdG8gL3RtcGRpci9sdHAtNllmY2djaEVhZC9MVFBfbWVtSjVvSUM3
L21udGRpciBmc3R5cD1leHQyIGZsYWdzPTAKbWVtY29udHJvbDA0LmM6MTE4OiBUSU5GTzogQ2hp
bGQgNDA2MTAgaW4gbGVhZl9DOiBBbGxvY2F0aW5nIHBhZ2VjYWNoZTogNTI0Mjg4MDAKbWVtY29u
dHJvbDA0LmM6MTE4OiBUSU5GTzogQ2hpbGQgNDA2MTEgaW4gbGVhZl9EOiBBbGxvY2F0aW5nIHBh
Z2VjYWNoZTogNTI0Mjg4MDAKbWVtY29udHJvbDA0LmM6MTE4OiBUSU5GTzogQ2hpbGQgNDA2MTIg
aW4gbGVhZl9GOiBBbGxvY2F0aW5nIHBhZ2VjYWNoZTogNTI0Mjg4MDAKbWVtY29udHJvbDA0LmM6
OTk6IFRJTkZPOiBDaGlsZCA0MDYxMyBpbiB0cnVua19HOiBBbGxvY2F0aW5nIGFub246IDE1NTE4
OTI0OAp0c3RfdGVzdC5jOjQzODogVEJST0s6IENoaWxkICg0MDYxMykga2lsbGVkIGJ5IHNpZ25h
bCBTSUdLSUxMCgpISU5UOiBZb3UgX01BWV8gYmUgaGl0IGJ5IGtub3duIGtlcm5lbCBmYWlsdXJl
czoKCkxvdyBldmVudHMgaW4gRjogaHR0cHM6Ly9idWd6aWxsYS5zdXNlLmNvbS9zaG93X2J1Zy5j
Z2k/aWQ9MTE5NjI5OAoKU3VtbWFyeToKcGFzc2VkICAgMApmYWlsZWQgICAwCmJyb2tlbiAgIDEK
c2tpcHBlZCAgMAp3YXJuaW5ncyAwCmluY3JlbWVudGluZyBzdG9wCjw8PGV4ZWN1dGlvbl9zdGF0
dXM+Pj4KaW5pdGlhdGlvbl9zdGF0dXM9Im9rIgpkdXJhdGlvbj00IHRlcm1pbmF0aW9uX3R5cGU9
ZXhpdGVkIHRlcm1pbmF0aW9uX2lkPTIgY29yZWZpbGU9bm8KY3V0aW1lPTAgY3N0aW1lPTM4Mwo8
PDx0ZXN0X2VuZD4+PgpJTkZPOiBsdHAtcGFuIHJlcG9ydGVkIHNvbWUgdGVzdHMgRkFJTApMVFAg
VmVyc2lvbjogMjAyNTAxMzAtMzktZzdmMzkyMmEyNAoKICAgICAgICMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwoKICAgICAgICAg
ICAgRG9uZSBleGVjdXRpbmcgdGVzdGNhc2VzLgogICAgICAgICAgICBMVFAgVmVyc2lvbjogIDIw
MjUwMTMwLTM5LWc3ZjM5MjJhMjQKICAgICAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwoK

--------------enqYGFMiMhRfVSrS7sjs3t7G
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--------------enqYGFMiMhRfVSrS7sjs3t7G--
